class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|
      t.string :name_en 
      t.string :name_zh
      t.string :component_id
      t.integer :tier
      t.integer :value
      t.string :get_from

      t.timestamps
    end
  end
end
