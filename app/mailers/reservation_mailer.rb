class ReservationMailer < ActionMailer::Base
  default :from => "noreply@localhost"

    def reservation_notification(reservation, restaurant)
      @reservation = reservation
      @restaurant = restaurant
      @user = User.find(@restaurant.user_id)
      mail(:to => @user.email, :subject => "reservation requested at " + @restaurant.name)      
    end
end
