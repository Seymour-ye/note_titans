class BlueprintElement < ApplicationRecord
  belongs_to :blueprint
  belongs_to :element
end
