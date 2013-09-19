class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  has_secure_password
  has_many :questions
  has_many :answers
  validates_presence_of :name, :email, :password
  # validates :name, presence: true

  # include BCrypt

end
