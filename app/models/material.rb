class Material < ApplicationRecord
  belongs_to :blueprint
  belongs_to :material, polymorphic: true
  belongs_to :quality, optional: true
end
