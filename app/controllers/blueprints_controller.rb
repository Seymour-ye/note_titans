class BlueprintsController < ApplicationController
  before_action :set_blueprint, only: %i[ show edit update destroy ]

  # GET /blueprints or /blueprints.json
  def index
    @blueprints = Blueprint.all.includes(:type, :unlock_type, blueprint_workers: [:worker], materials: [:materialable, :quality])
    @categories = Category.all.includes(:types)
    @resources = Resource.all
    @components = Component.all
    @tiers = (1..Blueprint.maximum(:tier)).to_a
  end

  # GET /blueprints/1 or /blueprints/1.json
  def show
  end

  # GET /blueprints/new
  def new
    @blueprint = Blueprint.new
  end

  # GET /blueprints/1/edit
  def edit
  end

  # POST /blueprints or /blueprints.json
  def create
    @blueprint = Blueprint.new(blueprint_params)

    respond_to do |format|
      if @blueprint.save
        format.html { redirect_to blueprint_url(@blueprint), notice: "Blueprint was successfully created." }
        format.json { render :show, status: :created, location: @blueprint }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blueprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blueprints/1 or /blueprints/1.json
  def update
    respond_to do |format|
      if @blueprint.update(blueprint_params)
        format.html { redirect_to blueprint_url(@blueprint), notice: "Blueprint was successfully updated." }
        format.json { render :show, status: :ok, location: @blueprint }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blueprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blueprints/1 or /blueprints/1.json
  def destroy
    @blueprint.destroy

    respond_to do |format|
      format.html { redirect_to blueprints_url, notice: "Blueprint was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def filter_update
    @blueprints = Blueprint.all.includes(:type, :unlock_type, blueprint_workers: [:worker], materials: [:materialable, :quality])

    # params['tier']
    @blueprints = @blueprints.where(tier: params['tier']) #if params['tier'].present?

    # params['type']
    @blueprints = @blueprints.where(type_id: params['type']) #if params['type'].present?
    
    # params['valid_resource']
    if params['valid_resource'].present?
      @blueprints = @blueprints
                    .joins(:resources)  # join @blueprints and resource table
                    .where(resources: { resource_id: params['valid_resource'] }) #find the records associated with params
                    .group('blueprints.id') # grouping records by blueprint's id
                    .having('COUNT(DISTINCT resources.id) = ?', params['valid_resource'].size) #filter the blueprints with leng(param) size records in final table
                    .to_a # convert to array of blueprint instance
    end

    # params['invalid_resource']
    if params['invalid_resource'].present?
      @blueprints = @blueprints.where.not(id: Blueprint.joins(:resources).where(resources: { resource_id: params['invalid_resource'] }).select(:id))
    end

    # params['valid_component']
    if params['valid_component'].present?
      @blueprints = @blueprints
                    .joins(:components)  # join @blueprints and component table
                    .where(components: { component_id: params['valid_component'] }) #find the records associated with params
                    .group('blueprints.id') # grouping records by blueprint's id
                    .having('COUNT(DISTINCT components.id) = ?', params['valid_component'].size) #filter the blueprints with leng(param) size records in final table
                    .to_a # convert to array of blueprint instance
    end
    # params['invalid_component']
    if params['invalid_component'].present?
      @blueprints = @blueprints.where.not(id: Blueprint.joins(:components).where(components: { component_id: params['invalid_component'] }).select(:id))
    end

    # params['sort_by']
    if params['sort_by'].present?
      @blueprints = @blueprints.sort_by(&params['sort_by'].to_sym).reverse
    end

    respond_to do |format|
      format.html { redirect_to blueprints_url}
      format.turbo_stream
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blueprint
      @blueprint = Blueprint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blueprint_params
      params.require(:blueprint).permit(:name_en, :name_zh, :type_id, :blueprint_id, :tier, :value, :craft_time, :merchant_xp)
    end
end
