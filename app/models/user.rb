class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  has_secure_password
  has_many :questions
  has_many :answers
  validates :name, :email, :presence => true, :uniqueness => true

end
