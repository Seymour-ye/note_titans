namespace :worker do
  desc "import worker info from google spreadsheet"
  task import: :environment do
    url = "https://docs.google.com/spreadsheets/d/1WLa7X8h3O0-aGKxeAlCL7bnN8-FhGd3t7pz2RCzSg8c/export?format=xlsx"
    xls = Roo::Spreadsheet.open(url, extension: :xlsx)
    @sheet = xls.sheet('Workers')
    (2..@sheet.last_row).each do |row|
      @row = row

      profession_en = cell_val('a')
      worker = Worker.find_or_create_by(profession_en: profession_en)

      worker.name_en = cell_val('b')

      worker.save!

      # puts "Worker imported successfully: #{profession_en}"
    end 
    puts "Worker imported successfully."
  end

  desc "update chinese translations and img id for workers"
  task zh_update: :environment do
    url = Rails.root.join('lib', 'assets', 'data_sheets', 'data_collected.xlsx')
    xlsx = Roo::Excelx.new(url.to_s)
    @sheet = xlsx.sheet("Worker")
    (2..@sheet.last_row).each do |row|
      @row = row 

      profession_en = cell_val('a')
      worker = Worker.find_or_create_by(profession_en: profession_en)

      worker.name_zh = cell_val('b')
      worker.worker_id = cell_val('c')
      worker.profession_zh = cell_val('d')

      worker.save!

      # puts "Worker Chinese Translation updated successfully: #{worker.profession_zh}"
    end 
    puts "Worker Chinese Translation updated succesfully."
  end

  def cell_val(col)
    @sheet.cell(@row,col) unless @sheet.cell(@row,col) == '---'
  end
end
