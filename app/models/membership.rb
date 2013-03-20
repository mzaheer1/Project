class Membership < ActiveRecord::Base
  attr_accessible :group_id, :user_id
   belongs_to :user
   belongs_to :group
   validates_presence_of :user_id
   validates_presence_of :group_id
   validates_uniqueness_of :group_id, :scope => [:user_id]

end
