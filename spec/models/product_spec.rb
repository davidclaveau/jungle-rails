require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    # validates :category, presence: true
    it "should successfully create a category" do
      category = nil
      expect{ category.products.create!(:name => nil, :price => 350, :quantity => 10).to raise_error(ActiveRecord::RecordInvalid) }
    end

    # validates :name, presence: true
    it "should succeed in creating a product" do
      category = Category.create!
      product1 = category.products.create!(:name => "Product", :price => 350, :quantity => 10)
      expect(product1).to be_present
    end
      
    # validates :name, presence: true
    it "should fail if name doesn't exist" do
      category = Category.create!
      expect{ category.products.create!(:name => nil, :price => 350, :quantity => 10).to raise_error(ActiveRecord::RecordInvalid) }
    end

    # validates :price, presence: true
    it "should fail if price doesn't exist" do
      category = Category.create!
      expect{ category.products.create!(:name => "Product", :price => nil, :quantity => 10).to raise_error(ActiveRecord::RecordInvalid) }
    end

    # validates :quantity, presence: true
    it "should fail if quantity doesn't exist" do
      category = Category.create!
      expect{ category.products.create!(:name => "Product", :price => 350, :quantity => nil).to raise_error(ActiveRecord::RecordInvalid) }
    end
    
  end
end