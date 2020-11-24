class Order < ApplicationRecord

belongs_to :item
belongs_to :cart

  def total
    item.price
  end

end
