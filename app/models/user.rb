class User < ActiveRecord::Base

  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def reviewed?(restaurant)
    reviews.where(:restaurant_id == restaurant.id).any?
  end


end
