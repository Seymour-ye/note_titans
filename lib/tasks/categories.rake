namespace :categories do
  desc "import the categories from xlsx"
  task import: :environment do
    url = Rails.root.join('lib', 'assets', 'data_sheets', 'data_collected.xlsx')
    xlsx = Roo::Excelx.new(url.to_s)
    @sheet = xlsx.sheet("Category")
    (2..@sheet.last_row).each do |row|
      @row = row

      name_en = cell_val('a')
      category = Category.find_or_create_by(name_en: name_en)

      category.name_zh = cell_val('b')
      category.category_id = cell_val('c')

      category.save!

      puts "Category imported successfully: #{name_en}"
    end
  end

end
