class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :worker_id
      t.string :name_en
      t.string :name_zh
      t.string :profession_en
      t.string :profession_zh

      t.timestamps
    end
  end
end
