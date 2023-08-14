class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :region_id, :city, :street, :building, :phone, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'must be in the format XXX-XXXX' }
    validates :region_id
    validates :city
    validates :street
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits long' }
    validates :token
  end
  validates :region_id, numericality: { other_than: 0, message: 'Select a region' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: purchase.id, postcode: postcode, region_id: region_id, city: city, street: street, building: building, phone: phone)
  end
end




