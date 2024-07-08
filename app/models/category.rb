class Category < ApplicationRecord
    def name
        if I18n.locale == :zh && self.name_zh != nil
            self.name_zh
        else
            self.name_en
        end
    end

    def img
        "Fan Kit Assets (Shop Titans)/Filter Types/icon_global_itemtype_#{self.category_id}_landscape_selected.png"
    end
end
