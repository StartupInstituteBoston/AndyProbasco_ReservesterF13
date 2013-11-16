class ReservationMailer < ActionMailer::Base
  default :from => "noreply@localhost"

    def reservation_notification(reservation, restaurant)
      
      @reservation = reservation
      @restaurant = restaurant
      @owner = Owner.find(@restaurant.owner_id)
      mail(:to => @owner.email, :subject => "reservation requested at " + @restaurant.name)      
    end
end
