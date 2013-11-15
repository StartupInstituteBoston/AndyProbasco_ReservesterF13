require 'spec_helper'

describe "login" do

  context "user doesn't exist" do
    it "should display error" do 
      get "owners/sign_in"
      expect(response.body).to include("User does not exist")
    end
  end
  
  context "user has an account" do
    context "password is correct" do
      #it "logs in user" do
      #end
      it "redirects them to index page" do
         get "owners/sign_in"
         expect(response.body).to include("Index")
      end
    end
    context "password is incorrect" do
      it "prompts user to try again" do
        get "owners/sign_in"
        expect(response.body).to include("Incorrect password, try again")
      end
    end
  end
  context "a field is empty" do
    it "prompts the user to fill fields" do
       get "owners/sign_in"
       expect(response.body).to include("field blank")
    end
  end
end
