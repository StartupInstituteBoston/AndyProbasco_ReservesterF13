class StarsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    unless current_user.starred_restaurants.find_by :id => @restaurant.id
      current_user.starred_restaurants << @restaurant
    end
    redirect_to @restaurant
  end
  
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    if current_user.starred_restaurants.find_by :id => @restaurant.id
      current_user.starred_restaurants.delete(@restaurant)
    end
    redirect_to @restaurant
  end
end
