class User < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  validates_presence_of :name
end
