require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :each do
      @product = Product.new(
        name: "Product",
        price: 350,
        quantity: 10,
        category: Category.new(
          name: "Category"
        )
      )
    end
    
    it "should successfully create a category" do
      category = Category.new(
        name: "Category"
      )
      expect(category).to be_valid
    end

    it "should succeed in creating a product" do
      @product.save
      expect(@product).to be_valid
    end
    
    it "should fail if product name doesn't exist" do
      @product.name = nil
      @product.save

      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it "should fail if product price isn't a number" do
      @product.price = "foo"
      @product.save

      expect(@product.errors.full_messages[0]).to eq("Price is not a number")
    end
    
    it "should fail if quantity doesn't exist" do
      @product.quantity = nil
      @product.save

      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end
    
  end
end