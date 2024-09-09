class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :responsibility_id, presence: true
  validates :region_id, presence: true
  validates :time_id, presence: true
  validates :price, presence: true
end
