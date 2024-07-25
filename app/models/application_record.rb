class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def formatted_time(num_in_s)
    h = num_in_s / 3600
    m = (num_in_s % 3600) / 60
    s = num_in_s % 60

    ret = ""
    ret << format('%d', h) << I18n.t('time.hours') if h != 0
    ret << " " if ret != ""
    ret << format('%d', m) << I18n.t('time.minutes') if m != 0
    ret << " " if ret != ""
    ret << format('%d', s) << I18n.t('time.seconds') if s != 0
    return ret
  end 
end
