class CreateQualities < ActiveRecord::Migration[7.0]
  def change
    create_table :qualities do |t|
      t.string :quality_id
      t.string :name_en
      t.string :name_zh

      t.timestamps
    end
  end
end
