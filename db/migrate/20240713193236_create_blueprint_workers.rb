class CreateBlueprintWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :blueprint_workers do |t|
      t.references :blueprint, null: false, foreign_key: true
      t.references :worker, null: false, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
