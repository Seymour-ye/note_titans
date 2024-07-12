class Blueprint < ApplicationRecord
  belongs_to :type
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
end