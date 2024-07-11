class Component < ApplicationRecord
    has_many :materials, as: :material

    def name
        if I18n.locale == :zh && self.name_zh != nil
            self.name_zh
        else
            self.name_en
        end
    end

    def img
        "Fan Kit Assets (Shop Titans)/Components/#{self.component_id}.png"
    end
    
end
