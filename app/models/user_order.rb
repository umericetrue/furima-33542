class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :addresses, :building, :phone_number, :order_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :preference_id, numericality: { other_than: 0, message: "must be selected" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: "Input half-width numbers"}
  end
  validates :phone_number, length: { maximum: 11 }

  def save
    order = Order.create(user_id: current_user.id, item_id: params[:id])
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end