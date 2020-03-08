class Api::V1::CouponController < ApplicationController
  skip_forgery_protection
  before_action :check_presence

  rescue_from ActiveRecord::InvalidForeignKey do |_e|
    render json: { error: 'Could not find category' }, status: :not_found
  end

  def create
    @coupon = Coupon.new(coupon_params)

    if @coupon.save
      respond_to do |format|
        format.json { render json: coupon_params, status: :created }
      end
    end
  end

  private

  def check_presence
    if Coupon.exists?(coupon_params['code'])
      render json: { error: 'Coupon already exists' }, status: :unprocessable_entity
    end
  end

  def coupon_params
    params.require(:coupon).permit(:code, :discount_amount, :discount_type, :expiration_date, :category_id)
  end
end
