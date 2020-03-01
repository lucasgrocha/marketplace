class Category < ApplicationRecord
  has_many :products
  has_many :coupons

  has_paper_trail
end
