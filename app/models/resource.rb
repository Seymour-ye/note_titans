class Resource < ApplicationRecord
    has_many :materials 
    
    def name
        if I18n.locale == :zh && self.name_zh != nil
            self.name_zh
        else
            self.name_en
        end
    end

    def img
        "Fan Kit Assets (Shop Titans)/Resources/icon_global_resource_#{self.resource_id}.png"
    end
end
