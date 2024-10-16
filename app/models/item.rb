class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  # ActiveHashモデルとのアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :responsibility
  belongs_to_active_hash :region
  belongs_to_active_hash :delivery_time
  # バリデーション
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :status_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :responsibility_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :region_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :delivery_time_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は300以上9999999以下である必要があります' }

  validate :image_attached
  def sold_out?
    # 例えば、購入された場合の判定方法。具体的には購入情報を管理するモデルがあると仮定しています。
    Order.exists?(item_id: id)
  end
end

  private

def image_attached
  errors.add(:image, "can't be blank") unless image.attached?
end
