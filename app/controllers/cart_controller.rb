class CartController < ApplicationController

  def index
    unless current_user
        redirect_to "/500"
    end
  end

  def remove_item
    @cart.items.delete(Item.where(id: params[:id]))
    redirect_to action: :index
  end

end
