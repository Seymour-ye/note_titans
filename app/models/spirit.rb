class Spirit < ApplicationRecord
  has_many :blueprint_spirits
  has_many :blueprints, through: :blueprint_spirits

  def img 
    "Fan Kit Assets (Shop Titans)/Skills/Enchantment/icon_global_skill_i_#{spirit_id}.png"
  end
end
