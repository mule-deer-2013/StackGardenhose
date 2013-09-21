class Vote < ActiveRecord::Base
  attr_accessible :value, :user, :votable_id, :votable_type, :user_id
  belongs_to :votable, polymorphic: true
  belongs_to :user
  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }
end


# class Holiday < ActiveRecord::Base
#   validates :name, uniqueness: { scope: :year,
#     message: "should happen once per year" }
# end

# validates_uniqueness_of :user_id, :scope => :friend_id
