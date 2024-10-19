class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :street, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end

  validates :region_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(postal_code:, region_id:, city:, street:, building_name:,
                   phone_number:, order_id: order.id)
  end
end
