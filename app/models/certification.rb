class Certification < ApplicationRecord
  
  has_many :certification_managers, dependent: :destroy
  has_many :profiles, through: :certification_managers
  
end