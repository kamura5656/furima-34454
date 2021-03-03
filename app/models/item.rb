class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_day
  belongs_to :first_address
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :contents
    validates :image
    validates :category_id        , numericality: { other_than: 1 }
    validates :status_id          , numericality: { other_than: 1 }
    validates :delivery_fee_id    , numericality: { other_than: 1 }
    validates :delivery_day_id    , numericality: { other_than: 1 }
    validates :first_address_id   , numericality: { other_than: 1 }
    validates :price              , numericality: { only_integer: true    , 
                                                       less_than: 10000000,
                                        greater_than_or_equal_to: 300}
  end
end
