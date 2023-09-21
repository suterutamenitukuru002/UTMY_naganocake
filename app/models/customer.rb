class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy


  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :telephone_number, presence: true

  def full_name
    self.family_name + " " + self.first_name
  end

  def full_name_kana
    self.family_name_kana + " " + self.first_name_kana
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end
