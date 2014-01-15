class Review < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :user

  validates :rating, presence: true
  validates :content, presence: true
  validates :name, presence: true

end
