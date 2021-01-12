class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-).' }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only half-width numbers.' },
                             length: { maximum: 11 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number)
  end
end
