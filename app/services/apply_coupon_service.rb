class ApplyCouponService
  attr_reader :product, :coupon

  def initialize(product_id, coupon_code)
    @product = Product.find(product_id)
    @coupon  = Coupon.find(coupon_code)
  end

  def perform
    return 'Invalid Coupon' if invalid_coupon?

    calculate_discount
  end

  private

  def invalid_coupon?
    coupon.expired? || !available_for_category?
  end

  def available_for_category?
    product.category.coupons.ids.include? coupon.code
  end

  def calculate_discount
    price           = product.price
    discount_amount = coupon.discount_amount

    return price - discount_amount if coupon.fixed?
    if coupon.percentage?
      return (price - (price * discount_amount / 100)).round(2)
    end

    0
  end
end
