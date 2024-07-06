namespace :components do
  desc "import the components from google spreadsheet and insert them to blueprints table"
  task import: :environment do
    url = "https://docs.google.com/spreadsheets/d/1WLa7X8h3O0-aGKxeAlCL7bnN8-FhGd3t7pz2RCzSg8c/export?format=xlsx"
    xls = Roo::Spreadsheet.open(url, extension: :xlsx)
    @sheet = xls.sheet('Quest Components')
    (2..@sheet.last_row).each do |row|
      @row = row 
      name_en = cell_val('a')
      tier = cell_val('b')
      value = cell_val('c')
      get_from = cell_val('d')
      instance = Component.find_by(name_en: name_en)
      if instance 
        instance.update( name_en: name_en,
                          tier: tier,
                          value: value,
                          get_from: get_from)
      else 
        Component.create( name_en: name_en,
                          tier: tier,
                          value: value,
                          get_from: get_from)
      end 
    end
  end

  desc "import the chinese translation and image url from xlsx"
  task zh_update: :environment do
    url = Rails.root.join('lib', 'assets', 'data_sheets', 'data_collected.xlsx')
    xlsx = Roo::Excelx.new(url.to_s)
    @sheet = xlsx.sheet("Components")
    (2..@sheet.last_row).each do |row|
      @row = row 
      name_en = cell_val('a')
      name_zh = cell_val('b')
      component_id = cell_val('c')
      value = cell_val('d')
      tier = cell_val('e')
      instance = Component.find_by(name_en: name_en)
      if instance 
        if value == nil
          instance.update( name_en: name_en,
                            name_zh: name_zh,
                            component_id: component_id)
        else
          instance.update( name_en: name_en,
                            name_zh: name_zh,
                            component_id: component_id,
                            tier: tier,
                            value: value)
        end
      else 
        Component.create( name_en: name_en,
                          name_zh: name_zh,
                          component_id: component_id,
                          tier: tier,
                          value: value)
      end 
    end
  end

  def cell_val(col)
    @sheet.cell(@row,col) unless @sheet.cell(@row,col) == '---'
  end
end

