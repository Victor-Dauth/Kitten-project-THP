class Cart < ApplicationRecord
  
  belongs_to :user
  has_many :orders

  def total
    orders.to_a.sum(&:total)
  end

end
