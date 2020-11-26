class Order < ApplicationRecord

  belongs_to :item
  belongs_to :cart
  belongs_to :recap_order, optional: true

  def total
    item.price
  end

end
