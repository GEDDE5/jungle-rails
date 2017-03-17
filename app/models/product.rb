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

  #  TODO revise the review rating logic to reduce sql overhead

  def review_count
    self.reviews.count
  end

  def has_reviews?
    review_count > 0
  end

  def overall_rating
    overall = 0.to_f
    self.reviews.each do |review|
      overall += review.rating
    end
    (overall / review_count).round(2)
  end

  def needs_half_star?
    (0.25..0.75) === (overall_rating % 1) ? true : false
  end

  def star_rating
    (0..0.75) === (overall_rating % 1) ? overall_rating.floor : overall_rating.ceil
  end

end
