class OrdersController < ApplicationController

  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :authenticate_user!

  
  def new
    @order = Order.new
  end

  def create
    item = Item.find(params[:item_id])
    @order = @cart.orders.create(item: item)
    flash[:sucess] = 'Ajouté au panier !'
    # respond_to do |format|
    #   if @order.save
    #     redirect_to @order.cart
    #   else
    #     redirect_to root_path
    #   end
    # end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to cart_path(current_user), notice: 'Element supprimé.' }
    end
  end

private

  def order_params
  end
end
