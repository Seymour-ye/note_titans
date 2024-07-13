class CreateBlueprintTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :blueprint_types do |t|
      t.string :type_id
      t.string :description_en
      t.string :description_zh

      t.timestamps
    end
  end
end
