class PaymentsController < ApplicationController

  def new
    @total = params[:total]
  end
  
  def create
    # Amount in cents
    @total = params[:total].to_d
    @user = current_user
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: (@total*100).to_i,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path

  else 
    
    create_recap_order(@user)
    mails_order(@user)
    reset_cart(@user)
  end

  private

  def mails_order(user)
    OrderMailer.items_email(user).deliver_now
    OrderMailer.purchase_confirm_admin(user).deliver_now
  end

  def create_recap_order(user)

    @recap_order = RecapOrder.create(user: user)

    user.cart.orders.each do |order|
      order.update(recap_order: @recap_order)
    end
  end

  def reset_cart(user)
    cart = user.cart
    cart.orders.delete_all
  end
end
