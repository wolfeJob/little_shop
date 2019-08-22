class Cart

  attr_reader :contents

  def initialize(initial_contents)
     @contents = initial_contents || Hash.new(0)
  end

  def add_item(id)
    @contents[id.to_s] = count_of(id) + 1
  end

  def total_count
    @contents.values.sum
  end

  def count_of(id)
      @contents[id.to_s].to_i
  end

  def grand_total
   grand_total = 0.0
   @contents.each do |item_id, quantity|
     # binding.pry
     # item.select(:item_id == item_id)
     grand_total += Item.find(item_id).price * quantity
   end
   grand_total
 end

 def actual_items
   @contents.map do |item_id, quantity|
     Item.find(item_id)
   end
 end

 def subtotal(item_id)
   @contents[item_id.to_s] * Item.find(item_id).price
 end

end
