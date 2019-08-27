require 'rails_helper'

describe "Destroy a Merchant" do
  before :each do
    @bike_shop = Merchant.create(name: "Brian's Bike Shop", address: '123 Bike Rd.', city: 'Richmond', state: 'VA', zip: 80203)
    @chain = @bike_shop.items.create(name: "Chain", description: "It'll never break!", price: 50, image: "https://www.rei.com/media/b61d1379-ec0e-4760-9247-57ef971af0ad?size=784x588", inventory: 5)
  end

  it "I can delete a merchant" do
    visit "merchants/#{@bike_shop.id}"

    click_on "Delete Merchant"

    expect(current_path).to eq('/merchants')
    expect(page).to_not have_content("Brian's Bike Shop")
  end

  it 'When I delete a merchant, their items are destroyed' do
    visit "merchants/#{@bike_shop.id}"

    click_on "Delete Merchant"

    expect(page).to_not have_content(@chain.name)
  end

    it 'If a merchant has items ordered then I get a message that it cannot be deleted when I try to delete' do
      order = Order.create(username: 'Christopher', address: '1234 5th St', city: 'Denver', state: 'CO', zipcode: 80021)
      OrderItem.create(order: order, item: @chain, quantity: 1, price: @chain.price)

      visit "merchants/#{@bike_shop.id}"

      click_on "Delete Merchant"

      expect(page).to have_content("#{@bike_shop.name} cannot be deleted becasue they have items on order")
    end
end
