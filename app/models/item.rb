class Item < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :image_url, presence: true
	validates :description, length: {in: 10..100}

  has_many :orders

end
