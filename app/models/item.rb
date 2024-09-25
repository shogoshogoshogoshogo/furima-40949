class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  # ActiveHashモデルとのアソシエーション
  belongs_to_active_hash :category_id
  belongs_to_active_hash :status_id
  belongs_to_active_hash :responsibility_id
  belongs_to_active_hash :region_id
  belongs_to_active_hash :time_id

  # バリデーション
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :status_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :responsibility_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :region_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :time_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                    message: 'は300以上9999999以下である必要があります' }

  validate :image_attached

  private

  def image_attached
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
