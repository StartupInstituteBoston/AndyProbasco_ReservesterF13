class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def dashboard
    if current_user
      @user = current_user
    else
      render 'restaurants#index'
    end
  end

end
