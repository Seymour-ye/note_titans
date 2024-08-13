module BlueprintsHelper
  def blueprint_name_bg_img
    "Fan Kit Assets (Shop Titans)/Player Level Loops & Titles/Banners/img_player_titles_01.png"
  end

  def filter_set(default, param, value)
    if session[:filter].present?
      if session[:filter][param].present?
        if session[:filter][param] == value || session[:filter][param].include?(value)
          return true 
        else 
          return false 
        end
      else 
        return false
      end
    else
      return default
    end
  end
end
