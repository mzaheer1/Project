class Attend < ActiveRecord::Base
  #after_filter :checkIfMemberOfGroup
  #validate :checkIfMemberOfGroup
  attr_accessible :event_id, :user_id, :group_id
  belongs_to :user
  belongs_to :event
  belongs_to :group
  validates_uniqueness_of :event_id, :scope => [:user_id]
end




