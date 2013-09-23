class Answer < ActiveRecord::Base
  attr_accessible :body, :user, :question
  belongs_to :user
  belongs_to :question

  has_many :votes, :as => :votable
  validates :body, :user, :question, :presence => true

end
