class User < ActiveRecord::Base
  attr_accessible :email, :userid, :name, :password
  has_secure_password
  validates :email, :presence => true
  validates_uniqueness_of :userid
  #validates_uniqueness_of :email
  validates_uniqueness_of :name
  has_many :memberships, :dependent => :destroy
  
  has_many :events, :through => :attends
  has_many :groups, :through => :memberships
  has_many :attends, :dependent => :destroy
  cattr_accessor :current_user


  before_save :makelowercase

  def makelowercase
    User.name.downcase
  end

end
