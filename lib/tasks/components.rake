namespace :components do
  desc "import the components from google spreadsheet and insert them to blueprints table"
  task import: :environment do
    url = "https://docs.google.com/spreadsheets/d/1WLa7X8h3O0-aGKxeAlCL7bnN8-FhGd3t7pz2RCzSg8c/export?format=xlsx"
    xls = Roo::Spreadsheet.open(url, extension: :xlsx)
    @sheet = xls.sheet('Quest Components')
    (2..@sheet.last_row).each do |row|
      @row = row 

      name_en = cell_val('a')
      component = Component.find_or_create_by(name_en: name_en)

      component.tier = cell_val('b')
      component.value = cell_val('c')
      component.get_from = cell_val('d')

      component.save!

      puts "Component imported successfully: #{name_en}."
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
      component = Component.find_or_create_by(name_en: name_en)

      component.name_zh = cell_val('b')
      component.component_id = cell_val('c')
      component.value = cell_val('d') if cell_val('d') != nil 
      component.tier = cell_val('e') if cell_val('e') != nil

      component.save!

      puts "Component updated successfully: #{name_en}."
    end
  end

  def cell_val(col)
    @sheet.cell(@row,col) unless @sheet.cell(@row,col) == '---'
  end
end

