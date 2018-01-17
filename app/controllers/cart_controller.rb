class CartController < ApplicationController

  def index
    redirect_to '/500' unless current_user
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: @cart.id.to_s
      end
    end
  end

  def remove_item
    @cart.items.delete(Item.where(id: params[:id]))
    redirect_to action: :index
  end

end
