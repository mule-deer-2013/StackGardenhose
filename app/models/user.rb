class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :questions
  has_many :answers
end
