class Category < ApplicationRecord
    has_many :types, dependent: :destroy

    def name
        if I18n.locale == :zh && name_zh != nil
            name_zh
        else
            name_en
        end
    end

    def img
        "Fan Kit Assets (Shop Titans)/Filter Types/icon_global_itemtype_#{category_id}_landscape_selected.png"
    end
end
