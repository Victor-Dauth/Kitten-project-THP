class CartsController < ApplicationController
    before_action :authenticate_user!
    before_action :cart_exists?, :is_my_cart?, only: [:show]

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

  def show
    @cart = Cart.find(params[:id])
  end

private

  def cart_params
    params.fetch(:cart, {})
  end

  def cart_exists?
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound  
      flash[:warning] = "Oups, on dirait que ce panier n'existe pas encore 😬"
      redirect_to root_path
    end
  end
  
  def is_my_cart?
    if Cart.find(params[:id]).user_id != current_user.id
      flash[:warning] = "Ah bon on va sur les paniers des autres pour vérifier que le controller est sécure 😁 ?"
      redirect_to root_path
    end
  end

end
