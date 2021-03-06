class Course < ActiveRecord::Base
  attr_accessible :description, :title, :date_begin, :date_end, :city
  validates :title, :length => { :in => 3..50 }

  has_many :events

  has_many :subscriptions
  has_many :users, :through => :subscriptions, :dependent => :destroy

  def admin
    User.find(Subscription.where(:course_id => self.id, :admin => true).first.user_id)
  end
end
