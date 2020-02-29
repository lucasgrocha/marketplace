class Category < ApplicationRecord
  has_many :products

  has_paper_trail
end
