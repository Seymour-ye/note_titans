class Quality < ApplicationRecord
    has_many :materials

    def name
        if I18n.locale == :zh && self.name_zh != nil
            self.name_zh
        else
            self.name_en
        end
    end

    def img
        "Fan Kit Assets (Shop Titans)/Quality Indicators/icon_global_quality_#{self.quality_id}.png"
    end
end
