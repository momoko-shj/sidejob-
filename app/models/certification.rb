class Certification < ApplicationRecord
  
  # 資格登録機能：メンターにより実装済み。エラーとなった際に自力での対応が困難と判断し実装を取り下げ。
  
  has_many :certification_managers, dependent: :destroy
  has_many :profiles, through: :certification_managers
  
end