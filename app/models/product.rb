class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def sold_out?
    self.quantity == 0
  end

  def overall_rating
    overall = 0.to_f
    count = 0
    self.reviews.each do | review |
      overall += review.rating
      count += 1
    end
    unless count == 0
      "#{(overall / count).round(2)} out of 5"
    else
      "Not yet rated"
    end
  end

end
