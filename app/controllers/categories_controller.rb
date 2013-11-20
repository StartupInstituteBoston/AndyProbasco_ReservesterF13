class CategoriesController < ApplicationController

  def index 
    @categories = Category.all
  end
  
  def show 
    @category = Category.find(params[:id])
  end
  
  def edit
  end
  
  def new
  end
  
  def update
  end
  
  def create
  end
  
  def destroy
  end
end
