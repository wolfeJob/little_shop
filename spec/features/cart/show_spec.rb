require 'rails_helper'
include ActionView::Helpers::TextHelper

describe 'Cart Show Page' do
 describe 'When I view my cart' do
   before :each do
     @merchant_1 = Merchant.create(name: 'Pie Shop', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80001)
     @merchant_2 = Merchant.create(name: 'Donut Shop', address: '321 Main St', city: 'Denver', state: 'CO', zip: 80233)
     @pie = @merchant_1.items.create(name: 'Pie', description: "Yummy Pie!", price: 15, image:"https://images-na.ssl-images-amazon.com/images/I/511RQsDqUgL._SX522_.jpg", inventory: 2 )
     @donut = @merchant_2.items.create(name: 'Donut', description: "Delicious Donut!", price: 3, image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/1920px-Glazed-Donut.jpg(364 kB)
https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/1920px-Glazed-Donut.jpg
', inventory: 10 )
   end
   it 'it shows all items and each item displays the name, image, merchant, price, quantity, subtotal, and grand total' do
     visit "/items"
     within("#item-#{@pie.id}") do
     click_button 'Add Item'
   end
     # visit '/items'
     # within("#item-#{@donut.id}")
     # click_button 'Add Item'
     visit '/cart'
     within "#item-#{@pie.id}" do
       expect(page).to have_link(@merchant_1.name)
       expect(page).to have_link(@pie.name)
       expect(page).to have_css("img[src*='#{@pie.image}']")
       expect(page).to have_content("Sold by: #{@merchant_1.name}")
       expect(page).to have_content("Price: $#{(@pie.price)}")
       expect(page).to have_content("Quantity: 1")
       expect(page).to have_content("Subtotal: $#{(@pie.price)}")
     end
     # within "#item-#{@donut.id}" do
     #   expect(page).to have_link(@merchant_2.name)
     #   expect(page).to have_link(@donut.name)
     #   expect(page).to have_css("img[src*='#{@donut.image}']")
     #   expect(page).to have_content("Sold by: #{@merchant_2.name}")
     #   expect(page).to have_content("Price: #{number_to_currency(@donut.price)}")
     #   expect(page).to have_content("Quantity: 1")
     #   expect(page).to have_content("Subtotal: #{number_to_currency(@donut.price)}")
     # end
     expect(page).to have_content("Total: $#{((@pie.price))}")
   end
   it "I can view my cart when it is empty" do
     visit '/cart'
     expect(page).to have_content('Your Cart is Empty')
     expect(page).to_not have_button('Empty Cart')
   end
   it 'I can empty my cart' do
     visit "/items"
     within("#item-#{@pie.id}") do
     click_button 'Add Item'
   end
     # visit "/items/#{@donut.id}"
     # click_button 'Add to Cart'
     visit '/cart'
     click_button 'Empty Cart'
     expect(current_path).to eq('/cart')
     expect(page).to have_content('Your Cart is Empty')
     expect(page).to have_content('Cart: 0')
     expect(page).to_not have_button('Empty Cart')
   end
 end
end
