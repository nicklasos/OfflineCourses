class Visitor < ActiveRecord::Base
  attr_accessible :event_id, :user_id

  belongs_to :user
  belongs_to :event

  def self.already_go?(event, user)
      Visitor.where(:event_id => event.id, :user_id => user.id).any?
  end
end
