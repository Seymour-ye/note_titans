class Element < ApplicationRecord
  has_many :blueprint_elements
  has_many :blueprints, through: :blueprint_elements

  def img 
    "Fan Kit Assets (Shop Titans)/Elements/Affinity/icon_global_element_#{element_id}.png"
  end
end
