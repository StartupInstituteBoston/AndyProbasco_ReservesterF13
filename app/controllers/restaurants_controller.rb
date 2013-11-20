class RestaurantsController < ApplicationController
  
 # before_filter :authenticate_owner!
  
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    #logger.debug @restaurant.inspect
    
    address = @restaurant.address.strip.squeeze.gsub(' ', '+')
    @staticMapURL = 'http://maps.googleapis.com/maps/api/staticmap?center=' + 
					address + 
					'&markers=' + 
					address + 
					'&zoom=13&size=600x300&maptype=roadmap&sensor=false'  
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
    
    if current_owner 
		@restaurant.owner = current_owner
    end
    
    if @restaurant.save
		redirect_to @restaurant
	else
		render "new"
	end
    
  end
 
  def update
    @restaurant = Restaurant.find(params[:id])

    if current_owner && current_owner.id = @restaurant.owner_id
        if @restaurant.update(restaurant_params)
          
          @restaurant.categories.clear
          params[:restaurant][:category_ids].each do |category_id|
            @restaurant.category_restaurants.create!(category_id: category_id)
          end
          
          redirect_to @restaurant
		else
			render "edit"
		end
    else
		redirect_to @restaurant
	end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if current_owner && current_owner.id = @restaurant.owner_id
		@restaurant.destroy
    end
    redirect_to restaurants_path
  end
  
  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :phone_number, :address, :image, :owner)
    end

end
