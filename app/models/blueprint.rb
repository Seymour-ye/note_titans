class Blueprint < ApplicationRecord
  belongs_to :type

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
