class Question < ActiveRecord::Base
  attr_accessible :title, :body, :user_id
  belongs_to :user
  has_many :answers

  has_many :votes, :as => :votable


  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true

end
