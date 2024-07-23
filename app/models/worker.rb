class Worker < ApplicationRecord
    has_many :blueprint_workers
    has_many :blueprints, through: :blueprint_workers
    def name
        if I18n.locale == :zh && name_zh != nil
            name_zh
        else
            name_en
        end
    end

    def profession
        if I18n.locale == :zh && name_zh != nil
            name_zh
        else
            name_en
        end
    end

    def img
        "Fan Kit Assets (Shop Titans)/Character Portraits/#{worker_id}_head.png"
    end
end
