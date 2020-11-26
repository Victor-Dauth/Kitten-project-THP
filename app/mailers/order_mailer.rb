class OrderMailer < ApplicationMailer
  default from: 'dautheville@hotmail.com'

  def items_email(user)
    @user = user

    @user.cart.orders.each do |order|
      attachments.inline[order.item.image_url] = File.read("#{Rails.root}/app/assets/images/#{order.item.image_url}")
    end

    mail(to: @user.email, subject: 'Ta commande KittyPic!') 
  end

  def purchase_confirm_admin(user)
    @user = user

    mail(to: "kitty_admin@yopmail.com", subject: "Commande n° #{@user.recap_orders.last.id}") 
  end
end
