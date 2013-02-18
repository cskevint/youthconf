class User < ActiveRecord::Base

  attr_accessible :email,
                  :name,
                  :password_digest,
                  :password,
                  :password_confirmation,
                  :date_of_birth,
                  :role

  has_and_belongs_to_many :conferences

  has_secure_password

  validates_presence_of :password, :on => :create

  def is_admin
    role == 'admin'
  end

  def is_organizer
    role == 'organizer'
  end
end
