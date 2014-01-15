class Restaurant < ActiveRecord::Base

  has_many :reviews
  
  validates :name, presence: true
  validates :description, presence: true


  def average_rating
    return 'Unrated' if reviews.none?
    total = reviews.inject(0) {|sum, review| sum += review.rating}
    total/reviews.length
  end

end
