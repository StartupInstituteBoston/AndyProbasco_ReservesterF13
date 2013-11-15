class ReservationsController < ApplicationController
		
	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
    	@reservation = @restaurant.reservations.create(params[:reservation].permit(:email, :requested_date_and_time, :comment))
	    if @reservation.save
			redirect_to restaurant_path(@restaurant)
		else
			redirect_to restaurant_path(@restaurant)
		end
    	
  	end	
  	
  	def destroy
  		@restaurant = Restaurant.find(params[:restaurant_id])
    	@reservation = @restaurant.comments.find(params[:id])
    	@reservation.destroy
    	redirect_to restaurant_path(@restaurant)
    end
end
