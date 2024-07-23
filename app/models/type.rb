class Type < ApplicationRecord
  belongs_to :category

  def name
    if I18n.locale == :zh && name_zh != nil
        name_zh
    else
        name_en
    end
  end

  def img
      "Fan Kit Assets (Shop Titans)/Item Types/icon_global_item_#{type_id}_big.png"
  end
end
