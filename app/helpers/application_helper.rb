module ApplicationHelper
    include ActiveSupport::NumberHelper
    
    def active_class(controller_name)
        controller_name == controller.controller_name ? 'active' : ''
    end

    def game_icon
        'Fan Kit Assets (Shop Titans)/Logos/ShopTitans_Logo_RGB.png'
    end

    def currency_gold_img
        'Fan Kit Assets (Shop Titans)/Currencies/icon_global_gold.png'
    end
end
