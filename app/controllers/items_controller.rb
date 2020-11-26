class ItemsController < ApplicationController

  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
    @item_rand = Item.all.reject {|item| item == @item }.sample(3)

  end


  
end
