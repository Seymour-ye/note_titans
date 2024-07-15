class AddUnlockTypeToBlueprints < ActiveRecord::Migration[7.0]
  def change
    add_reference :blueprints, :unlock_type, null: false, foreign_key: true
  end
end
