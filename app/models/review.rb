class Review < ActiveRecord::Base

  belongs_to :restaurant

  validates :rating, presence: true
  validates :content, presence: true
  validates :name, presence: true

end
