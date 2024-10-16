class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :addreess

  validates :total_price, presence: true
  validates :token, presence: true
end
