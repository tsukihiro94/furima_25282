class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  
         has_many :items
         has_many :addresses
         has_one :order

         validates :nickname, :family_name, :first_name, :family_name_kana,
                   :first_name_kana, :birthday, presence: true
end
