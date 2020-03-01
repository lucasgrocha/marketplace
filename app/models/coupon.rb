class Coupon < ApplicationRecord
  belongs_to :category, optional: true

  enum discount_type: [ :percentage, :fixed ]
  has_paper_trail

  def expired?
    expiration_date <= DateTime.now.utc
  end

  def self.apply_discount(product, coupon)
    @coupon  = find(coupon)
    @product = product
    check_validity
    check_coupon_for_category
    do_apply
  rescue => e
    errors = ActiveModel::Errors.new(self)
    errors.add(:base, e.message)
  end

  private

  def self.check_validity
    return true unless @coupon.expired?

    raise 'Expired Coupon'
  end

  def self.check_coupon_for_category
    return true if @product.category.coupons.pluck(:code).include? @coupon.code

    raise 'Invalid Coupon for this category'
  end

  def self.do_apply
    price = @product.price

    return price - @coupon.discount_amount if @coupon.discount_type == 'fixed'
    price - ( price * @coupon.discount_amount / 100 ).round(2)
  end
end
