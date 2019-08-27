class Merchant <ApplicationRecord
  has_many :items, :dependent => :destroy
  has_many :order_items, through: :items

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip

def has_orders?
   id = self.items.joins(:orders).pluck(:merchant_id)[0]
   if id != nil
     true
   else
     false
   end
 end
end
