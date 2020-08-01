class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  
         has_many :items
         has_many :addresses
         has_one :order

         with_options presence: true do
         validates :nickname, :birthday
         validates :password, format: {with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}\z/, message: "Include both letters and numbers"}
         validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
         validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
        
         end

end
