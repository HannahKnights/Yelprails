class Restaurant < ActiveRecord::Base

  has_many :reviews

  validates :name, presence: true
  validates :description, presence: true


  def average_rating
    reviews.average(:rating) || 'Unrated'
  end

end
