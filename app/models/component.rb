class Component < ApplicationRecord
    has_many :materials, as: :materialable

    def name
        if I18n.locale == :zh && name_zh != nil
            name_zh
        else
            name_en
        end
    end

    def img
        "Fan Kit Assets (Shop Titans)/Components/#{component_id}.png"
    end
    
end
