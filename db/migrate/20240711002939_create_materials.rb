class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.references :blueprint, null: false, foreign_key: true
      t.references :materialable, null: false, polymorphic: true
      t.references :quality, optional: true, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
