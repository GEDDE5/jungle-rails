class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true

  def has_description?
    self.description != ""
  end
end
