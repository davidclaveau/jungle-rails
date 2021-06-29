require 'rails_helper'

RSpec.feature "Visitor adds products to the cart, cart updates by one", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add products to the cart, cart shows update" do
    visit root_path

    page.first('article.product').find_button('Add').click

    expect(page.should have_content('My Cart (1)'))

    save_and_open_screenshot "test-three-add-to-cart.png"
    
  end

end
