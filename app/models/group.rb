class Group < ActiveRecord::Base
  attr_accessible :description, :name, :tag , :sponsorid
  has_many :events
  has_many :users,:through => :memberships
  belongs_to :sponsor
  has_many :memberships, :dependent => :destroy
  has_many :attends
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :tag
end
