class Address < ApplicationRecord
  belongs_to :order
  validates :postal_code, presence: true
  validates :region_id, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone_number, presence: true
end
