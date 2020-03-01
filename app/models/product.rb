class Product < ApplicationRecord
  belongs_to :category

  has_paper_trail

  validates :price, numericality: { greater_than: 10 }
  validates_presence_of :title, :code, :bar_code, :manufacturer, :model

  validate :validity_of_bar_code

  private

  def validity_of_bar_code
    errors.add(:base, 'Invalid bar code') unless Barkick::GTIN.new(bar_code).valid?
  end
end
