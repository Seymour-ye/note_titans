class Material < ApplicationRecord
  belongs_to :blueprint
  belongs_to :materialable, polymorphic: true
  belongs_to :quality, optional: true
end
