namespace :categories do
  desc "import the categories from xlsx"
  task import: :environment do
    url = Rails.root.join('lib', 'assets', 'data_sheets', 'data_collected.xlsx')
    xlsx = Roo::Excelx.new(url.to_s)
    @sheet = xlsx.sheet("Category")
    (2..@sheet.last_row).each do |row|
      @row = row

      category_id = cell_val('c')
      category = Category.find_or_create_by(category_id: category_id)

      category.name_zh = cell_val('b')
      category.name_en = cell_val('a')

      category.save!

      # puts "Category imported successfully: #{category.name_zh}"
    end
    puts "Category imported successfully."
  end

  desc "import the types from xlsx"
  task type_import: :environment do 
    url = Rails.root.join('lib', 'assets', 'data_sheets', 'data_collected.xlsx')
    xlsx = Roo::Excelx.new(url.to_s)
    @sheet = xlsx.sheet("Type")
    (2..@sheet.last_row).each do |row|
      @row = row 

      type_id = cell_val('c')
      type = Type.find_or_create_by(type_id: type_id)

      type.name_en = cell_val('a')
      type.name_zh = cell_val('b')
      type.folder_name = cell_val('d')
      type.category = Category.find_by(category_id: cell_val('e'))

      type.save!

      # puts "Item Type imported successfully: #{type.name_zh} (#{type.category.name_zh})"
    end
    puts "Item Types imported successfully"
  end

  def cell_val(col)
    @sheet.cell(@row,col) unless @sheet.cell(@row,col) == '---'
  end

end
