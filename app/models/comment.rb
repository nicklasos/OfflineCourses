class Comment < ActiveRecord::Base
  attr_accessible :comment, :event_id, :user_id

  validates :comment, :length => { :in => 3..250 }

  belongs_to :event
  belongs_to :user
end
