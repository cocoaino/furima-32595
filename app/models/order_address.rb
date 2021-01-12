class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :shipping_area_id
    validates :city
    validates :address
    validates :building_name
    validates :phone_number
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end