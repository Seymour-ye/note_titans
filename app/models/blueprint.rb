class Blueprint < ApplicationRecord
  belongs_to :type
  belongs_to :unlock_type 

  has_many :blueprint_workers
  has_many :workers, through: :blueprint_workers

  # affinities
  has_many :blueprint_elements
  has_many :elements, through: :blueprint_elements
  has_many :blueprint_spirits
  has_many :spirits, through: :blueprint_spirits

  # crafting materials
  has_many :materials, dependent: :destroy
  has_many :components, through: :materials, source: :materialable, source_type: 'Component'
  has_many :precrafts, through: :materials, source: :materialable, source_type: 'Blueprint'
  has_many :resources, through: :materials, source: :materialable, source_type: 'Resource'

  has_many :material_postcrafts, class_name: 'Material', foreign_key: 'materialable_id', as: :materialable
  has_many :postcrafts, through: :material_postcrafts, source: :blueprint
  
  def name
    if I18n.locale == :zh && name_zh != nil
        name_zh
    else
        name_en
    end
  end

  def craft_time_formatted
    formatted_time(craft_time)
  end

  def category
    type.category 
  end

  def img
      "Fan Kit Assets (Shop Titans)/Items/#{type.folder_name}/#{blueprint_id}.png"
  end

  def img_tier
      "Fan Kit Assets (Shop Titans)/Market Filters/Tier Filters/icon_global_search_#{tier.humanize}_selected.png"
  end

  def unlock_description
    unlock_type.description
  end
end
