class Conference < ActiveRecord::Base
  attr_accessible :name, :city, :state_province, :country, :google, :formatted, :lat, :lng
end
