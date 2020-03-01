class Address < ApplicationRecord
  belongs_to :user

  validates :building_number, numericality: { greater_than: 0 }
  has_paper_trail
end
