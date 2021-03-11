class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_day
  belongs_to :first_address
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :name
    validates :contents
    validates :image
    validates :price, numericality: { only_integer: true }
    validates_inclusion_of :price,  { in: 300..9_999_999 }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :delivery_day_id
      validates :first_address_id
    end
  end
end
