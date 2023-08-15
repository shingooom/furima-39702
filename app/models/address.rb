class Address < ApplicationRecord
  belongs_to :purchase

  validates :postcode, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format XXX-XXXX' }
  validates :region_id, presence: true, numericality: { other_than: 0, message: 'Select a region' }
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits long' }
end
