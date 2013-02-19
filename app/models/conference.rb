class Conference < ActiveRecord::Base
  attr_accessible :name,
                  :city,
                  :state_province,
                  :country,
                  :google,
                  :formatted,
                  :lat,
                  :lng

  has_and_belongs_to_many :users

  has_many :posts

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
