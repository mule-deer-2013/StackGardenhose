class Answer < ActiveRecord::Base
  attr_accessible :body, :user_id, :question_id
  belongs_to :user
  belongs_to :question
  
  has_many :votes, :as => :votable


  validates_presence_of :body, :user_id, :question_id
  validates_uniqueness_of :body
end
