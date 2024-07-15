class BlueprintWorker < ApplicationRecord
  belongs_to :blueprint
  belongs_to :worker

  validates :level, presence: true
end
