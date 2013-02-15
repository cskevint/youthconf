class User < ActiveRecord::Base

  attr_accessible :email,
                  :name,
                  :password_digest,
                  :password,
                  :password_confirmation,
                  :date_of_birth,
                  :role

  has_secure_password

  validates_presence_of :password, :on => :create

end
