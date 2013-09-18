class User < ActiveRecord::Base
  attr_accessible :name, :email, :password_hash
  has_many :questions
  has_many :answers
end
