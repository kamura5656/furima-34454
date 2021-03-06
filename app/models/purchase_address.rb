class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :first_address_id, :second_address, :third_address, :fourth_address, :telephone, :user_id,
                :item_id, :price, :token

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :first_address_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :second_address
    validates :third_address
    validates :telephone,               format: { with: /\A\d{10,11}\z/ }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, first_address_id: first_address_id, second_address: second_address,
                   third_address: third_address, fourth_address: fourth_address, telephone: telephone, purchase_id: purchase.id)
  end
end
