class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types do |t|
      t.string :name_en
      t.string :name_zh
      t.string :type_id
      t.string :folder_name
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
