namespace :image do
  desc "TODO"
  task zip_update: :environment do
    puts "TODO//IMAGE ZIP UPDATE"
  end

  desc "migrate local image files to target location"
  task local_migrate: :environment do
    system("sudo cp \"lib/assets/images/atlab_boomerang.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Daggers/\"")
    system("sudo cp \"lib/assets/images/atlab_kyoshifan.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Daggers/\"")
    system("sudo cp \"lib/assets/images/atlab_heavyarmor.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Heavy Armor/\"")
    system("sudo cp \"lib/assets/images/atlab_fireplate.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Heavy Armor/\"")
    system("sudo cp \"lib/assets/images/atlab_armor.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Light Armor/\"")
    system("sudo cp \"lib/assets/images/atlab_robe.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Clothes/\"")
    system("sudo cp \"lib/assets/images/atlab_firehelm.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Helmets/\"")
    system("sudo cp \"lib/assets/images/atlab_amulet.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Amulets/\"")
    system("sudo cp \"lib/assets/images/atlab_mace.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Maces/\"")
    system("sudo cp \"lib/assets/images/atlab_spiritmask.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Items/Rogue Hats/\"")

    puts "Local images migrate successfully."
  end

end
