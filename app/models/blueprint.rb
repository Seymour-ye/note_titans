class Blueprint < ApplicationRecord
  belongs_to :type
  has_many :materials, dependent: :destroy
  has_many :components, through: :materials, source: :material, source_type: 'Component'
  has_many :precrafts, through: :materials, source: :material, source_type: 'Blueprint'
  has_many :resources, through: :materials, source: :material, source_type: 'Resource'
  # has_many :postcrafts, through: :materials, as: :material

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
