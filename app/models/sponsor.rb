class Sponsor < ActiveRecord::Base
  attr_accessible :description, :name
  validates :name, :presence => true
  validates_uniqueness_of :name  
end
