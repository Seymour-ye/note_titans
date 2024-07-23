class Quality < ApplicationRecord
    has_many :materials

    def name
        if I18n.locale == :zh && name_zh != nil
            name_zh
        else
            name_en
        end
    end

    def img
        "Fan Kit Assets (Shop Titans)/Quality Indicators/icon_global_quality_#{quality_id}.png"
    end
end
