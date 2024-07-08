class Type < ApplicationRecord
  belongs_to :category

  def name
    if I18n.locale == :zh && self.name_zh != nil
        self.name_zh
    else
        self.name_en
    end
  end

  def img
      "Fan Kit Assets (Shop Titans)/Item Types/icon_global_item_#{self.type_id}_big.png"
  end

  def item_img_folder
      "Fan Kit Assets (Shop Titans)/Items/#{self.folder_name}"
  end
end
