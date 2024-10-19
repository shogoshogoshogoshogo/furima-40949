class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :addreess

  validates :token, presence: true
end
