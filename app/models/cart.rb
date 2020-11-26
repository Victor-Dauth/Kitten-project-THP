class Cart < ApplicationRecord
  
  belongs_to :user
  has_many :orders

  def total
    self.orders.to_a.sum(&:total)
  end

end
