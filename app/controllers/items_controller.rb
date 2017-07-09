class ItemsController < ApplicationController
    
    def index
        @items = Item.all
        
      # @items = Item.all
      #render text: @items.map {|i| "#{i.name}: #{i.price}"}.join("<br/>")
    end
    
    #/items/1 GET
    def show
        unless @item = Item.where(id: params[:id]).first 
            render :text => "Page not found!", status: 404
        end
    end
    
    #/items/new GET
    def new
        #in order to save hints after non-valid input
        @item = Item.new
    end
    
    #/items/1/edit GET
    def edit
        @item = Item.find(params[:id])
    end
    
    #/items POST
    def create
        @parameters = params.require(:item).permit(:name, :price, :description, :weight)
        @item = Item.create(@parameters)
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
        @item = Item.find(params[:id])
        @parameters = params.require(:item).permit(:name, :price, :description, :weight)
        @item.update_attributes(@parameters)
        if @item.errors.empty?
            redirect_to item_path(@item)
        else
            render "edit"
        end
    end
    #GET - render
    #/items/1 DELETE(POST)
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to action: "index"
    end
        
end