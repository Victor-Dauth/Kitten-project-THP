class ItemsController < ApplicationController

  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end


	def random
	   random = Item.pluck(:id)
	   random.sample
	end
  
end
