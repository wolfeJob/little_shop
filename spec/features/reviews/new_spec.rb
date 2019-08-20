require 'rails_helper'

RSpec.describe 'New Merchant Item' do
  describe 'As a Visitor' do
    before :each do
      @scott = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
    end

    xit 'I can click a link to a new item form page' do
      visit "/merchants/#{@scott.id}/items"

      click_link 'New Item'

      expect(current_path).to eq("/merchants/#{@scott.id}/items/new")
    end

    xit 'I can create an  item for a merchant' do
      name = 'Pokemon Yellow'
      description = "Pokemon Yellow for GBA"
      price = 20
      image = 'https://images-na.ssl-images-amazon.com/images/I/71LLwCMhi%2BL._AC_SX430_.jpg'
      inventory = 5

      visit "/merchants/#{@scott.id}/items/new"

      fill_in 'Name', with: name
      fill_in 'Description', with: description
      fill_in 'Price', with: price
      fill_in 'Image', with: image
      fill_in 'Inventory', with: inventory
      click_button 'Create Item'
      expect(current_path).to eq("/merchants/#{@scott.id}/items")
      expect(page).to have_link(name)
      expect(page).to have_content(description)
      expect(page).to have_content("Price: #{number_to_currency(price)}")
      expect(page).to have_content("Active")
      expect(page).to have_content("Inventory: #{inventory}")
    end
  end
end
