class RecapOrdersController < ApplicationController

  def index
    @recap_orders = RecapOrder.all
  end
end
