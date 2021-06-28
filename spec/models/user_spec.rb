require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it "should successfully create a user" do
      user = User.create!(:name => "test_name", :email => "test@test.com", :password_digest => "password")
      expect(user).to be_present
    end
  end
end
