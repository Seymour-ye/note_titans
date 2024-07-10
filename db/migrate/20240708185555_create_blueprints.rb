class CreateBlueprints < ActiveRecord::Migration[7.0]
  def change
    create_table :blueprints do |t|
      t.string :name_en
      t.string :name_zh
      t.string :blueprint_id

      t.references :type, null: false, foreign_key: true
      
      #unlock prerequisite
      #research scrolls

      t.integer :tier
      t.integer :value

      t.integer :craft_time
      t.integer :merchant_xp
      t.integer :worker_xp 
      t.integer :fusion_xp 

      #required workers and worker levels

      t.integer :antique_tokens

      t.integer :favor
      t.integer :airship_power

      t.timestamps
    end
  end
end
