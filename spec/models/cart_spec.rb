require 'rails_helper'

RSpec.describe Cart do
  before :each do
    @scott = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
    @FFX_game = @scott.items.create!(name: 'FFX', description: "FFX For PS4", price: 20, image: 'https://upload.wikimedia.org/wikipedia/en/a/a7/Ffxboxart.jpg', active?: true, inventory: 5 )
    @cart = Cart.new({
      @FFX_game.id.to_s => 2
      })
  end

  describe "total_count" do
    it "calculates the total number of items it holds" do
      expect(
        @cart.total_count).to eq(2)
    end
  end

  describe "add_item" do
    it "adds a item to its contents" do
      @cart.add_item(@FFX_game.id.to_s)
      expect(@cart.contents).to eq({@FFX_game.id.to_s => 3})
    end
  end

  describe "count_of" do
  it "returns the count of all items in the cart" do
    @cart.add_item(@FFX_game.id.to_s)
    expect(@cart.count_of(@FFX_game.id.to_s)).to eq(3)
    end
  end

  describe "grand_total" do
    it "returns the grand total of all items in the cart" do
      expect(@cart.grand_total).to eq(40)
    end
  end

  describe "actual_items" do
    it "returns the actual items in the cart" do
      expect(@cart.actual_items).to eq({@FFX_game.id.to_s => 2})
    end
    end

end
