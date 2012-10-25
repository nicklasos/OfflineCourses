class Event < ActiveRecord::Base
  attr_accessible :subject, :time
  belongs_to :course
end
