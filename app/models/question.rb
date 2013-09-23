class Question < ActiveRecord::Base
  attr_accessible :title, :body, :user_id
  belongs_to :user
  has_many :answers
  has_many :votes, :as => :votable
  validates :title, :body, :user, presence: true


  def can_answer?(user)
    !owner? user
  end

  def owner?(user)
    self.user == user
  end
end
