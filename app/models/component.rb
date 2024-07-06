class Component < ApplicationRecord

    def img
        "Fan Kit Assets (Shop Titans)/Components/#{self.component_id}.png"
    end
end
