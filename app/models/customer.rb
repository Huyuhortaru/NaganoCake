class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # is_deletedがfalseならtrueを返すようにしている       
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  has_many :addresses
  has_many :cart_items
  has_many :orders
  
end
