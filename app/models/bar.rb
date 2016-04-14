class Bar < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:name, :description]

  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :description, presence: true

  def self.search(input)
    bars = []
    results = PgSearch.multisearch(input)
    results.each do |result|
      if result[:searchable_type] == "Review"
        review = Review.find_by(id: result[:searchable_id])
        bar = Bar.find_by(id: review.bar_id)
        bars << bar
      else
        bar = Bar.find_by(id: result[:searchable_id])
        bars << bar
      end
    end
    bars = Kaminari.paginate_array(bars)
    bars
  end
end
