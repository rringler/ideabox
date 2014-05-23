class Idea < ActiveRecord::Base
  belongs_to :user

  acts_as_voteable

  has_many :comments

  attr_accessor :parent

  scope :recent, ->(limit = 10) { order('created_at DESC').limit(limit) }

  validates :description, presence: true, length: { maximum: 255 }
  validates :user_id,     presence: true
end
