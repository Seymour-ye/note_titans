module ApplicationHelper
    include ActiveSupport::NumberHelper
    
    def active_class(controller_name)
        controller_name == controller.controller_name ? 'active' : ''
    end

    def tier_img(tier)
        "Fan Kit Assets (Shop Titans)/Market Filters/Tier Filters/icon_global_search_#{Humanize.format(tier)}_selected.png"
    end

    def tier_bg_img
        "Fan Kit Assets (Shop Titans)/Misc Icons/icon_global_level_item_s_r.png"
    end

    def game_icon
        'Fan Kit Assets (Shop Titans)/Logos/ShopTitans_Logo_RGB.png'
    end

    def currency_gold_img
        'Fan Kit Assets (Shop Titans)/Currencies/icon_global_gold.png'
    end

    def worker_bg_img
        'Fan Kit Assets (Shop Titans)/Player Level Loops & Titles/Rims/img_card_circle_blueprint_gold_rim.png'
    end
end
