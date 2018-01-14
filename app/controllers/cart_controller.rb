class CartController < ApplicationController

  def index
    unless current_user
        redirect_to "/500"
    end
    respond_to do |format|
      format.html
      format.pdf {
        render pdf: @cart.id.to_s
      }
    end
  end

  def remove_item
    @cart.items.delete(Item.where(id: params[:id]))
    redirect_to action: :index
  end

end
