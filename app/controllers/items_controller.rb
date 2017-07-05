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
    end
    
    #/items/1/edit GET
    def edit
    end
    
    #/items POST
    def create
       # @item = Item.create(name: params[:name], description: params[:description], price: params[:price], real: params[:real], weight: params[:weight])
        #Need item[variable] in the url zone
        #@item = Item.create(params[:item])
       # render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
        render text: "Item created!"
    end
    
    #/items/1 PUT
    def update
    end
    
    #/items/1 DELETE(POST)
    def destroy
    end
        
end