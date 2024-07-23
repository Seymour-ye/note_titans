class Resource < ApplicationRecord
    has_many :materials, as: :materialable
    def name
        if I18n.locale == :zh && name_zh != nil
            name_zh
        else
            name_en
        end
    end

    def img
        "Fan Kit Assets (Shop Titans)/Resources/icon_global_resource_#{resource_id}.png"
    end
end
