class Event < ActiveRecord::Base
  attr_accessible :subject, :time
  belongs_to :course

  has_many :visitors
  has_many :users, :through => :visitors

  has_many :comments

  validates :subject, :presence => true
end
