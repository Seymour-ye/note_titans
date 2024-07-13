class BlueprintType < ApplicationRecord
    def description
        if I18n.locale == :zh && self.description_zh != nil
            self.description_zh
        else
            self.description_en
        end
    end

    def img_bg
        "Fan Kit Assets (Shop Titans)/Blueprint Types/Backgrounds/img_card_circle_blueprint_#{self.type_id}.png"
    end

    def img_scroll
        "Fan Kit Assets (Shop Titans)/Blueprint Types/Backgrounds/img_global_blueprint_#{self.type_id}.png"
    end
end
