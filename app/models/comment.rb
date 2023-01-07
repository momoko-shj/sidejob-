class Comment < ApplicationRecord
belongs_to :user
belongs_to :profile

validates :text, presence: true

end
