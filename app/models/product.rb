class Product < ApplicationRecord
  belongs_to :category

  has_paper_trail
end
