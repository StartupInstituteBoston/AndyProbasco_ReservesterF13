class RestaurantsController < ApplicationController
  
 # before_filter :authenticate_user!
  
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
    
    if current_user
      @restaurant.user = current_user
    end
    
    if @restaurant.save
      redirect_to @restaurant
    else
      render "new"
    end
    
  end
 
  def update
    @restaurant = Restaurant.find(params[:id])

    if current_user && current_user.id = @restaurant.user_id
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
    if current_user && current_user.id = @restaurant.user_id
		@restaurant.destroy
    end
    redirect_to restaurants_path
  end
  
  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :phone_number, :address, :image, :user)
    end

end
