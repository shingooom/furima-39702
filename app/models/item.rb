class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  def sold_out?
    Purchase.exists?(item_id: id)
  end
  belongs_to :user
  has_one :purchase

  belongs_to :category
  belongs_to :status
  belongs_to :ship_fee
  belongs_to :region
  belongs_to :ship_day

  has_one_attached :image
  validates :image, presence: true
  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
end
