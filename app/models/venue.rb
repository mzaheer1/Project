class Venue < ActiveRecord::Base
  attr_accessible :address, :name

  has_many:events, :class_name => "Event", :foreign_key => 'venue_id'
  validates :address, :presence => true
  validates :name, :presence => true
end
