class Item < ApplicationRecord
  VALID_PRICE_REGEX = /\A[0-9]+\z/

  belongs_to :user
  # has_one :order
  has_one_attached :image

  # バリデーション
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :status_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :responsibility_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :region_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :time_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :price, presence: true, format: { with: VALID_PRICE_REGEX, message: 'は半角数字のみで入力してください' },
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300以上9999999以下である必要があります' }
end
