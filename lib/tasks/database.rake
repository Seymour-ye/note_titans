namespace :database do
  desc "list of tasks to initialize database"
  task init: :environment do
    system('./bin/rails db:migrate VERSION=0')
    Rake::Task["db:migrate"].invoke

    Rake::Task["components:import"].invoke
    Rake::Task["components:zh_update"].invoke
    Rake::Task["resources:import"].invoke 

  end

  desc "list of tasks to update database"
  task update: :environment do
    Rake::Task["components:import"].invoke
    Rake::Task["components:zh_update"].invoke
    Rake::Task["resources:import"].invoke

  end

end
