class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :nickname, presence: true
  validates :birthdate, presence: true

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :items, class_name: 'Items', foreign_key: 'user_id'
end
