class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def new
    # Initialize a new review for the specific restaurant
    @review = @restaurant.reviews.new
  end

  def create
    # Create a review associated with the restaurant
    @review = @restaurant.reviews.new(review_params)
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
