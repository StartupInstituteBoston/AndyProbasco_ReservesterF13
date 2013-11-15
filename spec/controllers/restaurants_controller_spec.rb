require 'spec_helper'

describe RestaurantsController do

  describe "#show" do
    let(:restaurant) { FactoryGirl.build(:restaurant, :id => 1, :address => '1 Cambridge Center, Cambridge, MA') }
    before { Restaurant.stub(:find) { restaurant } }
      
    it "should assign restaurant to the restaurant variable" do
      get :show, id: restaurant.id
      expect(assigns(:restaurant)).to eq restaurant
    end

    it "should generate a static map url" do 
      get :show, id: restaurant.id
      expect(assigns(:staticMapURL)).to eq "http://maps.googleapis.com/maps/api/staticmap?center=1+Cambridge+Center,+Cambridge,+MA&markers=1+Cambridge+Center,+Cambridge,+MA&zoom=13&size=600x300&maptype=roadmap&sensor=false"
    end
     
  end
end
