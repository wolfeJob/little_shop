class Merchant <ApplicationRecord
  has_many :items, :dependent => :delete_all

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip

  def has_orders?
    id = self.items.joins(:orders).pluck(:merchant_id)
    if id == self.id.to_s
      return true
    else
      return false
    end
  end
end
