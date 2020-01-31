class Book < ApplicationRecord
  validates :title, length: { maximum: 200, minimum: 1 }
  validates :body, length: { maximum: 200, minimum: 1 }
  belongs_to :user
end
