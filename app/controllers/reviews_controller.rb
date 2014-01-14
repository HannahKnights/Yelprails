class ReviewsController < ApplicationController

def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end

def create
  @restaurant = Restaurant.find(params[:restaurant_id])
  @restaurant.reviews.create params[:review].permit(:name, :content, :rating)
  redirect_to '/restaurants'
end

def edit

end

end
