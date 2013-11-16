class ReservationsController < ApplicationController
		
	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
    	@reservation = @restaurant.reservations.create(params[:reservation].permit(:email, :requested_date_and_time, :message))
	    if @reservation.save
        ReservationMailer.reservation_notification(@reservation, @restaurant).deliver
        redirect_to restaurant_path(@restaurant)
      else
        redirect_to restaurant_path(@restaurant)
      end
    	
  	end	
  	
  	def destroy
  		@restaurant = Restaurant.find(params[:restaurant_id])
    	@reservation = @restaurant.reservations.find(params[:id])
    	@reservation.destroy
    	redirect_to restaurant_path(@restaurant)
    end
end
