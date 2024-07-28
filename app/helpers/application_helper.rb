module ApplicationHelper
    include ActiveSupport::NumberHelper
    
    def active_class(controller_name)
        controller_name == controller.controller_name ? 'active' : ''
    end

    def craft_time_img
    "Fan Kit Assets (Shop Titans)/Misc Icons/icon_global_timer.png"
    end

    def merchant_xp_img
    "Fan Kit Assets (Shop Titans)/Misc Icons/icon_worker_bonus_academy.png"
    end

    def worker_xp_img
    "Fan Kit Assets (Shop Titans)/Misc Icons/icon_worker_xp_bonus.png"
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

    def favor_img
        "Fan Kit Assets (Shop Titans)/Stat Indicators/icon_global_kingscaprice_favor.png"
    end

    def airship_power_img
        "Fan Kit Assets (Shop Titans)/Stat Indicators/icon_global_dragoninvasion_airshippower.png"
    end

    def atk_img
        "Fan Kit Assets (Shop Titans)/Stat Indicators/Heroes/icon_global_attack.png"
    end

    def crit_img
        "Fan Kit Assets (Shop Titans)/Stat Indicators/Heroes/icon_global_critchance.png"
    end

    def def_img
        "Fan Kit Assets (Shop Titans)/Stat Indicators/Heroes/icon_global_defense.png"
    end

    def eva_img
        "Fan Kit Assets (Shop Titans)/Stat Indicators/Heroes/icon_global_evasion.png"
    end

    def hp_img
        "Fan Kit Assets (Shop Titans)/Stat Indicators/Heroes/icon_global_health.png"
    end


end
