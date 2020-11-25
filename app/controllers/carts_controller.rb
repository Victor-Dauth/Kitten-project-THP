class CartsController < ApplicationController
    before_action :authenticate_user!

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find_by_id(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create(cart_params)
    
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


private

  def cart_params
    params.fetch(:cart, {})
  end

end
