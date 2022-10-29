class Profile < ApplicationRecord
  
  has_many :work_experiences, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy
  belongs_to :user
    
  has_many :certification_managers, dependent: :destroy
  has_many :certifications, through: :certification_managers
  accepts_nested_attributes_for :certification_managers
  
  has_one_attached :image
  
  # enum certification: { eiken: 0, toiec: 1, zeirishi: 2, syaroushi: 3, chushokigyosindanshi: 4, gyoseisyoshi: 5, fp: 6, itpassport: 7, mos: 8, aws: 9, boki: 10 }

# 生年月日から年齢を算出する
  def age()
    date_format = "%Y%m%d"
    (updated_at.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end
  
  #プロフィールでユーザーフォローを実装
  def follow_by?(user)
   follows.exists?(user_id: user.id)
  end
  
end
