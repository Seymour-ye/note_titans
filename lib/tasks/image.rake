namespace :image do
  desc "TODO"
  task zip_update: :environment do
    puts "TODO//IMAGE ZIP UPDATE"
  end

  desc "migrate local image files to target location"
  task local_migrate: :environment do
    system("sudo cp \"lib/assets/images/atlab_boomerang.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Daggers/\"")

    puts "Local images migrate successfully."
  end

end
