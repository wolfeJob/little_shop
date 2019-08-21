class Item <ApplicationRecord
  belongs_to :merchant
  has_many :reviews

  validates_presence_of :name,
                        :description,
                        :price,
                        :image,
                        :inventory

  validates_inclusion_of :active?, in: [true, false]

  def sort_reviews(limit = nil, order = :asc)
    reviews.order(rating: order).limit(limit)
  end

  def average_rating
    reviews.average(:rating)
  end
end
