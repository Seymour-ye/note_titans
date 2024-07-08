class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name_en
      t.string :name_zh
      t.string :category_id

      t.timestamps
    end
  end
end
