class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  has_secure_password
  has_many :questions
  has_many :answers
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true
end
