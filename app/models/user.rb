class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :subscriptions
  has_many :courses, :through => :subscriptions
  
  has_many :comments

  # if user subscribed for some course
  def subscribed?(course_id)
    begin
      self.courses.find(course_id)
      return true
    rescue ActiveRecord::RecordNotFound
      return false
    end
  end
end
