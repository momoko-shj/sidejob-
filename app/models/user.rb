class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 def active_for_authentication?
  super && (is_deleted == false)
 end
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :work_experiences, dependent: :destroy
  
  validates :name, presence: true
  validates :phone, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :town, presence: true

end
