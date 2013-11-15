require 'spec_helper'

describe "Restaurant Routes" do
  
  describe "#show" do
    let(:restaurant) { FactoryGirl.build(:restaurant) }
    
    it 'should return 200' do
      get "restaurants/#{restaurant.id}"
      expect(response.status).to eq(200)
    end
  
  end
  
end
