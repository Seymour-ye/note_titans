namespace :blueprints do
  desc "import the blueprints from google spreadsheet and insert them to blueprints table"
  task import: :environment do
    url = "https://docs.google.com/spreadsheets/d/1WLa7X8h3O0-aGKxeAlCL7bnN8-FhGd3t7pz2RCzSg8c/export?format=xlsx"
    xls = Roo::Spreadsheet.open(url, extension: :xlsx)
    @sheet = xls.sheet('Blueprints')
    (2..@sheet.last_row).each do |row|
      @row = row

      name_en = cell_val('a')
      blueprint = Blueprint.find_or_create_by(name_en: name_en)

      blueprint.type = Type.find_by(name_en: cell_val('b'))

      blueprint.tier = cell_val('f')
      blueprint.value = cell_val('g')

      blueprint.craft_time = cell_val('h')
      blueprint.worker_xp = cell_val('m')
      blueprint.antique_tokens = cell_val('e')

      blueprint.fusion_xp = cell_val('n')

      blueprint.merchant_xp = cell_val('k')

      blueprint.favor = cell_val('o')
      blueprint.airship_power = cell_val('p')
      
      blueprint.save!

      puts "Blueprint imported successfully: #{name_en}"
    end 
  end

  desc "update the blueprints chinese translation and id from xlsx"
  task zh_update: :environment do 
    url = Rails.root.join('lib', 'assets', 'data_sheets', 'data_collected.xlsx')
    xlsx = Roo::Excelx.new(url.to_s)
    @sheet = xlsx.sheet("Blueprints")
    (2..@sheet.last_row).each do |row|
      @row = row 

      name_en = cell_val('a')
      blueprint = Blueprint.find_by(name_en: name_en)

      blueprint.name_zh = cell_val('b')
      blueprint.blueprint_id = cell_val('c')

      blueprint.save!

      puts "Chinese Translation updated successfully: #{blueprint.name_zh}"
    end 
  end

  def cell_val(col)
    @sheet.cell(@row,col) unless @sheet.cell(@row,col) == '---'
  end

end
