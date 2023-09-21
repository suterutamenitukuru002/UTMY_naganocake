class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  has_many :addresses, dependent: :destroy
 
  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :telephone_number, presence: true


  def active_for_authentication?
    super && (is_deleted == false)
  end
end
