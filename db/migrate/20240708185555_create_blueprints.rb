class CreateBlueprints < ActiveRecord::Migration[7.0]
  def change
    create_table :blueprints do |t|
      t.string :name_en
      t.string :name_zh
      t.string :blueprint_id

      t.references :type, null: false, foreign_key: true
      
      #unlock prerequisite - add later //DONE
      #research scrolls
      t.integer :research_scrolls 

      t.integer :tier
      t.integer :value

      t.integer :craft_time
      t.integer :merchant_xp
      t.integer :worker_xp 
      t.integer :fusion_xp 

      #required workers and worker levels - DONE

      t.integer :antique_tokens

      t.integer :favor
      t.integer :airship_power

      t.integer :discount_energy
      t.integer :surcharge_energy
      t.integer :suggest_energy
      t.integer :speed_up_energy

      t.integer :atk
      t.integer :def
      t.integer :hp
      t.integer :eva
      t.integer :crit

      t.timestamps
    end
  end
end
