class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  has_secure_password
  has_many :questions
  has_many :answers
  validates :email, :uniqueness => true
  validates :name, :email, :presence => true

  def can_answer?(question)
    question.can_answer?(self)
  end
end
