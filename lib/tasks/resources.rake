namespace :resources do
  desc "import the resources from xlsx"
  task import: :environment do
    url = Rails.root.join('lib', 'assets', 'data_sheets', 'data_collected.xlsx')
    xlsx = Roo::Excelx.new(url.to_s)
    @sheet = xlsx.sheet("Resources")
    (2..@sheet.last_row).each do |row|
      @row = row

      name_en = cell_val('a')
      resource = Resource.find_or_create_by(name_en: name_en)

      resource.name_zh = cell_val('b')
      resource.resource_id = cell_val('c')

      resource.save!

      puts "Resource imported successfully: #{name_en}."
    end

  end

end
