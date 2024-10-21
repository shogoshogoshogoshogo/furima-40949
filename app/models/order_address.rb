class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :street, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Only 10 or 11 digit numbers allowed' }
  end

  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(postal_code:, region_id:, city:, street:, building_name:, phone_number:, order_id: order.id)
  end
end
