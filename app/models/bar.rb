class Bar < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :description, presence: true

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
