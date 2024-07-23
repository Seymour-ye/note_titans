class UnlockType < ApplicationRecord
  def description
    if I18n.locale == :zh && description_zh != nil
        description_zh
    else
        description_en
    end
  end

  def img_bg
      "Fan Kit Assets (Shop Titans)/Blueprint Types/Backgrounds/img_card_circle_blueprint_#{type_id}.png"
  end

  def img_scroll
      "Fan Kit Assets (Shop Titans)/Blueprint Types/Backgrounds/img_global_blueprint_#{type_id}.png"
  end
end
