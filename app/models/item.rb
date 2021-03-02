class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_day
  belongs_to :first_address

  has_one_attached :image
  validates :genre_id, numericality: { other_than: 1 }
  validates :text, presence: true
end
