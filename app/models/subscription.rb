class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  def self.add_admin(user, course)
    sub = Subscription.where(:user_id => user.id, :course_id => course.id).first
    sub.admin = true
    sub.save
  end
end
