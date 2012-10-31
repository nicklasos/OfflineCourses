class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
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
