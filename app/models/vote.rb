class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :count, presence: true, numericality: true, inclusion: { in: -1..1 }
end
