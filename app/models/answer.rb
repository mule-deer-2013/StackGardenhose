class Answer < ActiveRecord::Base
  attr_accessible :body, :user_id, :question_id
  belongs_to :user
  belongs_to :question

  validates :body, presence: :true
end
