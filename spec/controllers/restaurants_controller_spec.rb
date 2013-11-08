require 'spec_helper'

describe RestaurantsController do

  describe "#show" do
    let(:restaurant) { FactoryGirl.create(:restaurant) }
  
    it "should display the show template for the restaurant" do
      get :show, it: restaurant.id
      
      expect(assigns(:restaurant)).to eq restaurant
    end

   end

end
