class Blueprint < ApplicationRecord
  belongs_to :type
  belongs_to :unlock_type 

  has_many :blueprint_workers
  has_many :workers, through: :blueprint_workers

  # crafting materials
  has_many :materials, dependent: :destroy
  has_many :components, through: :materials, source: :materialable, source_type: 'Component'
  has_many :precrafts, through: :materials, source: :materialable, source_type: 'Blueprint'
  has_many :resources, through: :materials, source: :materialable, source_type: 'Resource'

  has_many :material_postcrafts, class_name: 'Material', foreign_key: 'materialable_id', as: :materialable
  has_many :postcrafts, through: :material_postcrafts, source: :blueprint
  def name
    if I18n.locale == :zh && self.name_zh != nil
        self.name_zh
    else
        self.name_en
    end
  end

  def category
    self.type.category 
  end

  def img
      "Fan Kit Assets (Shop Titans)/Items/#{self.type.folder_name}/#{self.blueprint_id}.png"
  end

  def unlock_description
    self.unlock_type.description
  end
end
