class RestaurantsController < ApplicationController
  
 # before_filter :authenticate_owner!
  
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    
    address = @restaurant.address.strip.squeeze.gsub(' ', '+')
    @staticMapURL = 'http://maps.googleapis.com/maps/api/staticmap?center=' + address + '&markers=' + address + '&zoom=13&size=600x300&maptype=roadmap&sensor=false'
  end

  def new
	@restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end
  
#########################################################
 
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to @restaurant
  end
 
  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to @restaurant  
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end
#########################################################  
  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :phone_number, :address)
    end

end
