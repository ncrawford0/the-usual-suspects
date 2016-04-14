class Review < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:title, :body]

  belongs_to :bar
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :bar, presence: true
  validates :user, presence: true
  validates :rating,
    presence: true,
    numericality: { integer: true },
    inclusion: { in: 1..5 }
end
