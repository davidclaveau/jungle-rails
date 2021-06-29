require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it "should successfully create a user (password and confirmation match)" do
      user = User.create!(:name => "test_name", :email => "test@test.com", :password => "password", :password_confirmation => "password")
      expect(user).to be_present
    end
  
    it ("should provide an error when the password and confirmation don't match") do
      expect{ User.create!(:name => "test_name", :email => "test@test.com", :password => "password", :password_confirmation => "foo").to raise_error(ActiveRecord::RecordInvalid) }
    end

    it ("should provide an error when emails match, regardless of case") do
      user = User.create!(:name => "test_name", :email => "test@test.com", :password => "password", :password_confirmation => "password")
      expect(user).to be_present
      
      expect{ User.create!(:name => "test_name", :email => "TEST@TEST.com", :password => "password", :password_confirmation => "password").to raise_error(ActiveRecord::RecordInvalid) }
    end

    it ("should provide an error when name is null") do
      expect{ User.create!(:name => nil, :email => "test@test.com", :password => "password", :password_confirmation => "password").to raise_error(ActiveRecord::RecordInvalid) }
    end

    it ("should provide an error when password is fewer than six characters") do
      expect{ User.create!(:name => "Fake Name", :email => "test@test.com", :password => "foo", :password_confirmation => "password").to raise_error(ActiveRecord::RecordInvalid) }
    end
  end

  describe '.authenticate_with_credentials' do
    it ("should be nil and not allow user to login with incorrect password") do
      user = User.create!(:name => "test_name", :email => "test@test.com", :password => "password", :password_confirmation => "password")

      expect(User.authenticate_with_credentials("test@test", "foo")).to be_nil
    end

    it ("should allow user to login and return proper email") do
      user = User.create!(:name => "test_name", :email => "test@test.com", :password => "password", :password_confirmation => "password")

      expect(User.authenticate_with_credentials("test@test.com", "password")).to be_truthy.and have_attributes(:email => "test@test.com")
    end
    
    it ("should allow user to login and return proper email") do
      user = User.create!(:name => "test_name", :email => "test@test.com", :password => "password", :password_confirmation => "password")

      expect(User.authenticate_with_credentials("  TEST@TEST.com  ", "password")).to be_truthy.and have_attributes(:email => "test@test.com")
    end
  end
end
