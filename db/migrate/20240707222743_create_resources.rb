class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :name_en
      t.string :name_zh
      t.string :resource_id

      t.timestamps
    end
  end
end
