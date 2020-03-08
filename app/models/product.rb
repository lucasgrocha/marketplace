class Product < ApplicationRecord
  belongs_to :category

  has_paper_trail

  validates :price, numericality: { greater_than: 10 }
  validates_presence_of :title, :code, :bar_code, :manufacturer, :model

  validate :validity_of_bar_code

  def apply_coupon(coupon)
    Coupon.apply_discount(self, coupon)
  end

  private

  def validity_of_bar_code
    unless Barkick::GTIN.new(bar_code).valid?
      errors.add(:base, 'Invalid bar code')
    end
  end
end
