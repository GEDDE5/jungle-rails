class Review < ActiveRecord::Base
  belongs_to :product

  validates length: { in: 1..5, message: “must be a number between 1 and 5” }
  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
end
