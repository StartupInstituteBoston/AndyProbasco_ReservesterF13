class OwnersController < ApplicationController
  
  before_filter :authenticate_owner!
  
  def dashboard
    #before_filter :authenticate_owner!
    if current_owner
      @owner = current_owner
    else
      render 'restaurants#index'
    end
  end

end
