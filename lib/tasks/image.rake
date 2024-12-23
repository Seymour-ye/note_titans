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
    system("sudo mv \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_santa.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_christmas.png\"")
    system("sudo mv \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_luxuriousspirit.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_xolotl.png\"")
    system("sudo mv \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_opulentspirit.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_quetzalcoatl.png\"")
    system("sudo mv \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_rabbitspirit.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_bunny.png\"")
    system("sudo mv \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_turtle.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_ram.png\"")
    system("sudo mv \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_crab.png\" \"app/assets/images/Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_horse.png\"")

    puts "Local images migrate successfully."
  end

end
