class Conference < ActiveRecord::Base
  attr_accessible :name,
                  :city,
                  :state_province,
                  :country,
                  :google,
                  :formatted,
                  :lat,
                  :lng

  def url_code
    name.downcase.gsub(" ","")
  end

  def previous
    Conference.where(["id < ?", id]).last
  end

  def next
    Conference.where(["id > ?", id]).first
  end

end
