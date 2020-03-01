class Coupon < ApplicationRecord
  belongs_to :category, optional: true

  enum discount_type: [ :percentage, :fixed ]
  has_paper_trail
end
