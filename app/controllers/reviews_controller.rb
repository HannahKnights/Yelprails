class ReviewsController < ApplicationController

before_action :authenticate_user!

def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end

def create
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.create params[:review].permit(:content, :rating)
  @review.user = current_user
  @review.save ? redirect_to(restaurant_path(@restaurant)) : render('new')
end

def edit
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.find params[:id]
end

def update
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.find(params[:id])
  @review.update params[:review].permit(:content, :rating)
  redirect_to restaurant_path(@restaurant)
end

def destroy
  @restaurant = Restaurant.find(params[:restaurant_id])
  @restaurant.reviews.find(params[:id]).destroy
  redirect_to restaurant_path(@restaurant)

end

end
