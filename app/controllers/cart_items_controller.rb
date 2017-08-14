class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_cart_item, only: [:destroy]


  def create
    @cart.add_item(params, quantity)
    if @cart.save
      redirect_to cart_path
    else
      flash[:error] = "Problem with adding"
      redirect_to items_path
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path
  end

  private

    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_items_params
      params.require(:cart_item).permit(:item_id, :cart_id, :quantity)
    end

end
