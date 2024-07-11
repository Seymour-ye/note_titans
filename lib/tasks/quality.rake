namespace :quality do
  desc "import quality information and translation from xlsx"
  task import: :environment do
    url = Rails.root.join('lib', 'assets', 'data_sheets', 'data_collected.xlsx')
    xlsx = Roo::Excelx.new(url.to_s)
    @sheet = xlsx.sheet("Quality")
    (2..@sheet.last_row).each do |row|
      @row = row 

      quality_id = cell_val('a')
      quality = Quality.find_or_create_by(quality_id: quality_id)

      quality.name_en = cell_val('b')
      quality.name_zh = cell_val('c')

      quality.save!

      puts "Quality updated successfully:"
    end
  end

end
