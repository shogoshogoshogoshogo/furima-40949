class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KANA_REGEX = /\A[\p{katakana}\u30fc]+\z/

  validates :nickname, presence: true
  validates :birthdate, presence: true
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true do
    validates :family_name, format: { with: VALID_NAME_REGEX, message: '全角文字を使用してください' }
    validates :first_name, format: { with: VALID_NAME_REGEX, message: '全角文字を使用してください' }
    validates :family_name_kana, format: { with: VALID_KANA_REGEX, message: '全角カタカナのみ使用してください' }
    validates :first_name_kana, format: { with: VALID_KANA_REGEX, message: '全角カタカナのみ使用してください' }
  end
end
