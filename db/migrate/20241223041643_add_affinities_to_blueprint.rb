class AddAffinitiesToBlueprint < ActiveRecord::Migration[7.0]
  def change
    create_table :elements do |t|
      t.string :element_id
      t.timestamps
    end

    create_table :spirits do |t|
      t.string :spirit_id
      t.timestamps
    end

    create_table :blueprint_elements do |t|
      t.references :blueprint, null: false, foreign_key: true
      t.references :element, null: false, foreign_key: true
      t.timestamps
    end

    create_table :blueprint_spirits do |t|
      t.references :blueprint, null: false, foreign_key: true
      t.references :spirit, null: false, foreign_key: true
      t.timestamps
    end

  end
end