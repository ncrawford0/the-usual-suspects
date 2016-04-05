class Review < ActiveRecord::Base
  belongs_to :bar
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :bar_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true, numericality: {integer: true}, inclusion: {in: 1..5}
end
