class ReviewsController < ApplicationController

def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
end

def create
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.create params[:review].permit(:name, :content, :rating)
  @review.save ? redirect_to(restaurants_path) : render('new')
end

def edit
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.find params[:id]
end

def update
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.find(params[:id])
  @review.update params[:review].permit(:name, :content, :rating)
  redirect_to restaurants_path
end

def destroy
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.find(params[:id])
  @review.destroy
  redirect_to restaurants_path

end

end
