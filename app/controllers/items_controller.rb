class ItemsController < ApplicationController

    before_action :find_item,      only: [:show, :edit, :update, :destroy, :upvote]
    before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

    def index
        @items = Item
        #DESC descending
        @items = @items.where("price >= ?", params[:price_from])       if params[:price_from]
        @items = @items.where("created_at >= ?", 1.day.ago)            if params[:today]
        @items = @items.where("votes_count >= ?", params[:votes_from]) if params[:votes_from]
        #@items = Active Record Relation
        @items = @items.order("votes_count DESC", "price")
    end
    #/items/1 GET
    def show
        unless @item
            render :text => "Page not found!", status: 404
        end
    end

    def expensive
        @items = Item.where("price > 1000")
        render "index"
    end

    #/items/new GET
    def new
        #in order to save hints after non-valid input
        @item = Item.new
    end

    #/items/1/edit GET
    def edit
    end

    #/items POST
    def create
        @item = Item.create(item_params)
        if @item.errors.empty?
            redirect_to item_path(@item)
        else
            render "new"
        end
        #Need item[variable] in the url zone
        #@item = Item.create(params[:item])
    end

    #/items/1 PUT
    def update
        @item.update_attributes(item_params)
        if @item.errors.empty?
            redirect_to item_path(@item)
        else
            flash.now[:error] = "It seems that your input is not valid, try again.."
            render "edit"
        end
    end
    #GET - render
    #/items/1 DELETE(POST)
    def destroy
        @item.destroy
        redirect_to action: "index"
    end

    def upvote
        @item.increment!(:votes_count)
        redirect_to action: :index
    end

    private

    def find_item
         @item = Item.where(id: params[:id]).first
         render_404 unless @item
    end

    def item_params
        params.require(:item).permit(:name, :price, :real, :description, :weight, :image)
    end
end
