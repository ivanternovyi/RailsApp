class ItemsController < ApplicationController
    
    def index
        @items = Item.all
        render text: @items.map {|i| "#{i.name}: #{i.price}"}.join("<br/>")
    end
    
    def create
        @item = Item.create(name: params[:name], description: params[:description], price: params[:price], real: params[:real], weight: params[:weight])
        #Need item[variable] in the url zone
        #@item = Item.create(params[:item])
        render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
    end
    
end