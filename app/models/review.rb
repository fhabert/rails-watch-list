class Review < ApplicationRecord
  belongs_to :list
  validates :content, presence: true, length: { minimum: 6 }
  validates :rating, inclusion: { in: 0..5 }
end
