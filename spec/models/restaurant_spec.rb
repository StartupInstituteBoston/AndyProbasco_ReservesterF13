require 'spec_helper'

describe Restaurant do
  subject {Restaurant.new}
  
  describe 'body validation' do
    it "can't be empty" do
      subject.name = ""
      subject.should have(1).errors_on(:name)
    end
  end
  
end
