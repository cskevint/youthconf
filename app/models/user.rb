class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :name, :password_digest, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
end
