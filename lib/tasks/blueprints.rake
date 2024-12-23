namespace :blueprints do
  desc "import the blueprints from google spreadsheet and insert them to blueprints table"
  task import: :environment do
    url = "https://docs.google.com/spreadsheets/d/1WLa7X8h3O0-aGKxeAlCL7bnN8-FhGd3t7pz2RCzSg8c/export?format=xlsx"
    xls = Roo::Spreadsheet.open(url, extension: :xlsx)
    @sheet = xls.sheet('Blueprints')
    (2..@sheet.last_row).each do |row|
      @row = row

      # find the associated blueprint
      name_en = cell_val('a')
      blueprint = Blueprint.find_or_create_by(name_en: name_en)

      # type 
      type = cell_val('b')
      if type == "Enchantment" 
        if name_en.include?("Spirit")
          type = "Spirit"
        else 
          type  = "Element"
        end 
      end
      blueprint.type = Type.find_by(name_en: type)

      # blueprint unlock type
      special_free = ["Intro Tutorial", "Collection Book"]
      lcog = ["Luxurious Chest", "Opulent Chest", "Platinum Chest"]
      artifact = ["Major Artifact Chest", "Minor Artifact Chest"]
      prerequisite = cell_val('c')
      if !prerequisite || prerequisite.in?(special_free) || prerequisite.include?("Content Pass") || Worker.find_by(profession_en: prerequisite)
        type = UnlockType.find_by(type_id: 'blue')
      elsif prerequisite.in?(lcog)
        type = UnlockType.find_by(type_id: 'lcog')
      elsif prerequisite.in?(artifact)
        type = UnlockType.find_by(type_id: 'artifact')
      elsif prerequisite.include?("Chest")
        type = UnlockType.find_by(type_id: "chest")
      elsif prerequisite.include?("Pack") || prerequisite.include?("Offer") || prerequisite.include?("Superior")
        type = UnlockType.find_by(type_id: 'premium')
      end
      blueprint.unlock_type = type

      # blueprint item info
      blueprint.tier = cell_val('f')
      blueprint.value = cell_val('g')

      # blueprint crafting info
      blueprint.craft_time = cell_val('h')
      blueprint.antique_tokens = cell_val('e')
      blueprint.research_scrolls = cell_val('d')

      # blueprint XP info
      blueprint.worker_xp = cell_val('m')
      blueprint.fusion_xp = cell_val('n')
      blueprint.merchant_xp = cell_val('k')

      # blueprint event info
      blueprint.favor = cell_val('o')
      blueprint.airship_power = cell_val('p')
      # puts "#{blueprint.inspect}"
      blueprint.save!

      # blueprint worker info
      BlueprintWorker.where(blueprint_id: blueprint.id).destroy_all

      worker = Worker.find_by(profession_en: cell_val('r'))
      level = cell_val('s')
      BlueprintWorker.create(blueprint: blueprint, worker: worker, level: level) if worker != nil

      worker = Worker.find_by(profession_en: cell_val('t'))
      level = cell_val('u')
      BlueprintWorker.create(blueprint: blueprint, worker: worker, level: level) if worker != nil

      worker = Worker.find_by(profession_en: cell_val('v'))
      level = cell_val('w')
      BlueprintWorker.create(blueprint_id: blueprint.id, worker: worker, level: level) if worker != nil


      # blueprint resource info
      blueprint.materials.destroy_all

      resource = Resource.find_by(resource_id: "iron")
      amount = cell_val('y')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil

      resource = Resource.find_by(resource_id: "wood")
      amount = cell_val('z')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil
      
      resource = Resource.find_by(resource_id: "leather")
      amount = cell_val('aa')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil
      
      resource = Resource.find_by(resource_id: "herbs")
      amount = cell_val('ab')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil
      
      resource = Resource.find_by(resource_id: "steel")
      amount = cell_val('ac')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil
      
      resource = Resource.find_by(resource_id: "ironwood")
      amount = cell_val('ad')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil
      
      resource = Resource.find_by(resource_id: "fabric")
      amount = cell_val('ae')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil
      
      resource = Resource.find_by(resource_id: "oils")
      amount = cell_val('af')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil
      
      resource = Resource.find_by(resource_id: "mana")
      amount = cell_val('ag')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil
      
      resource = Resource.find_by(resource_id: "gems")
      amount = cell_val('ah')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil
      
      resource = Resource.find_by(resource_id: "essence")
      amount = cell_val('ai')
      blueprint.materials.create(materialable: resource, amount: amount) if amount != nil
      
      # Energy
      blueprint.discount_energy = cell_val('bs')
      blueprint.surcharge_energy = cell_val('bt')
      blueprint.suggest_energy = cell_val('bu')
      blueprint.speed_up_energy = cell_val('bv')

      # Equip Attr
      blueprint.atk = cell_val('ar') ? cell_val('ar') : 0
      blueprint.def = cell_val('as') ? cell_val('as') : 0
      blueprint.hp = cell_val('at') ? cell_val('at') : 0
      blueprint.eva = cell_val('au') ? cell_val('au') : 0
      blueprint.crit = cell_val('av') ? cell_val('av') : 0

      blueprint.save!

      # puts "Blueprint imported successfully: #{name_en}"
    end 
    puts "Blueprint imported successfully."
  end

  desc "import components required by blueprint crafting from google spreadsheet"
  task import_components: :environment do 
    url = "https://docs.google.com/spreadsheets/d/1WLa7X8h3O0-aGKxeAlCL7bnN8-FhGd3t7pz2RCzSg8c/export?format=xlsx"
    xls = Roo::Spreadsheet.open(url, extension: :xlsx)
    @sheet = xls.sheet('Blueprints')
    (2..@sheet.last_row).each do |row|
      @row = row

      name_en = cell_val('a')
      blueprint = Blueprint.find_by(name_en: name_en)

      # component 1
      quality = Quality.find_by(name_en: cell_val('al'))
      amount = cell_val('am')
      name = cell_val('ak')
      if quality != nil
        component = Blueprint.find_by(name_en: name)
      else
        component = Component.find_by(name_en: name)
      end
      blueprint.materials.create(materialable: component, quality: quality, amount: amount) if amount != nil

      # component 2
      quality = Quality.find_by(name_en: cell_val('ao'))
      amount = cell_val('ap')
      name = cell_val('an')
      if quality != nil
        component = Blueprint.find_by(name_en: name)
      else
        component = Component.find_by(name_en: name)
      end
      blueprint.materials.create(materialable: component, quality: quality, amount: amount) if amount != nil


      # puts "Blueprint Component updated successfully: #{blueprint.name_en}"
    end 
    puts "Blueprint Component updated successfully."
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

      # puts "Chinese Translation updated successfully: #{blueprint.name_zh}"
    end 
    puts "Chinese Translation updated successfully."
  end

  desc "import the blueprint unlock types from xlsx"
  task import_unlock_type: :environment do 
    url = Rails.root.join('lib', 'assets', 'data_sheets', 'data_collected.xlsx')
    xlsx = Roo::Excelx.new(url.to_s)
    @sheet = xlsx.sheet("BlueprintType")
    (2..@sheet.last_row).each do |row|
      @row = row 

      type_id = cell_val('a')
      type = UnlockType.find_or_create_by(type_id: type_id)

      type.description_en = cell_val('b')
      type.description_zh = cell_val('c')

      type.save!

      # puts "Blueprint Unlock Type imported successfully: #{type.type_id}"
    end 
    puts "Blueprint Unlock Type imported successfully"
  end 

  desc "initialize elements"
  task elements_init: :environment do 
    elements = ['fire', 'water', 'air', 'earth', 'light', 'dark', 'gold', 'all']
    elements.each do |e|
      element = Element.find_or_create_by(element_id: e)
      element.save!
    end
    puts "Elements initialized successfully."
  end

  desc "initialize spirits"
  task spirits_init: :environment do 
    t = Type.find_by(type_id: 'spirit')
    b = Blueprint.where(type_id: t.id)
    b.each do |s|
      s_id = s.name_en.split(' ').first.downcase
      spirit = Spirit.find_or_create_by(spirit_id: s_id)
      spirit.save!
    end
    puts "Spirits initialized successfully."
  end

  desc "update affinities"
  task update_affinities: :environment do 
    url = "https://docs.google.com/spreadsheets/d/1WLa7X8h3O0-aGKxeAlCL7bnN8-FhGd3t7pz2RCzSg8c/export?format=xlsx"
    xls = Roo::Spreadsheet.open(url, extension: :xlsx)
    @sheet = xls.sheet('Blueprints')
    (2..@sheet.last_row).each do |row|
      @row = row

      # find the associated blueprint
      name_en = cell_val('a')
      blueprint = Blueprint.find_by(name_en: name_en)
      blueprint.spirits.destroy_all
      blueprint.elements.destroy_all

      elementalAffinities = cell_val('ax') ? cell_val('ax').split(', ') : []
      elementalAffinities.each do |e|
        e.downcase!
        blueprint.elements << Element.find_by(element_id: e)
      end

      spiritAffinities = cell_val('ay') ? cell_val('ay').split(', ')  : []
      spiritAffinities.each do |s|
        spirit = s.split(' ').first.downcase
        blueprint.spirits << Spirit.find_by(spirit_id: spirit)
      end
    end 
    puts "Blueprint Affinities updated successfully."
  end

  desc "check for blueprint updates"
  task check_update: :environment do 
    puts "=============Check Blueprint update================"
    Blueprint.all.each do |blueprint|
      if !blueprint.blueprint_id || !blueprint.name_zh 
        puts "#{blueprint.name_en}  #{blueprint.type.name_zh}"
      end
    end
    puts "=====================DONE=========================="
  end


  def cell_val(col)
    @sheet.cell(@row,col) unless @sheet.cell(@row,col) == '---'
  end

end
