class Event < ActiveRecord::Base
  attr_accessible :name, :time, :venue_id , :group_id
  has_many :photos
  belongs_to :group, :class_name => 'Group', :foreign_key => :group_id
  belongs_to :venue, :class_name => 'Venue', :foreign_key => :venue_id
  has_many :users, :through => :attends
  validates :venue_id, :presence => true
  validates :name, :presence => true
  validates_uniqueness_of :venue_id, :scope => [:time] 
   
  has_many :attends, :dependent => :destroy


end

