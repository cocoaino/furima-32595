class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_charge, :shipping_area, :shipping_day

  validates :name, :price, :description, :image, presence: true
  validates_inclusion_of :price, in: 300..9_999_999
  validates :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, numericality: { other_than: 1 }
end
