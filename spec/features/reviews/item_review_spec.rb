require 'rails_helper'

describe 'Item Reviews' do
  describe 'When I visit an item Show Page' do
    before :each do
      @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @tire = @meg.items.create(name: 'Gatorskins', description: "They'll never pop!", price: 100, image: 'https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588', inventory: 12)
      @review = @meg.reviews.create(title: 'Awesome Tire', description: 'This tire works well', rating: 5)
    end

    it 'Displays a list of reviews for that item' do
      visit "/items/#{@tire.id}"
      within "#review-#{@review.id}" do
        expect(page).to have_content(@review.title)
        expect(page).to have_content(@review.description)
        expect(page).to have_content("Rating: #{@review.rating}")
      end
    end
  end
end
