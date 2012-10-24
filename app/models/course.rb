class Course < ActiveRecord::Base
  attr_accessible :description, :title
  validates :title, :length => { :in => 3..50 }

  belongs_to :user
  has_many :subscriptions
  has_many :users, :through => :subscriptions

  def owner
    User.find(self.owner_id)   
  end
end
