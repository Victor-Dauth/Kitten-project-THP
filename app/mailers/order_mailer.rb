class OrderMailer < ApplicationMailer
  default from: 'dautheville@hotmail.com'

  def items_email(user)
    @user = user

    mail(to: @user.email, subject: 'Ta commande KittyPic!') 
  end

  def purchase_confirm_admin(user)
    @user = user

    mail(to: "kitty_admin@yopmail.com", subject: 'Commande n°XX') 
  end
end
