class ReviewsController < ApplicationController

def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end

def create
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.create params[:review].permit(:name, :content, :rating)
  @review.save ? redirect_to(restaurant_path(@restaurant)) : render('new')
end

def edit
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.find params[:id]
end

def update
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.find(params[:id])
  @review.update params[:review].permit(:name, :content, :rating)
  redirect_to restaurant_path(@restaurant)
end

def destroy
  @restaurant = Restaurant.find(params[:restaurant_id])
  @restaurant.reviews.find(params[:id]).destroy
  redirect_to restaurant_path(@restaurant)

end

end
