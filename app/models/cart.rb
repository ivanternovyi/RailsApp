class Cart < ApplicationRecord
   has_many :cart_items
   has_many :items, through: :cart_items

   def add_item(item_params, quantity)
      @current_item = cart_items.find_by(item_id: item_params.id)
      if @current_item
        @current_item.quantity += quantity
        @current_item.save
      else
        new_item = cart_items.create(item_id: item_params.id,
          quantity: quantity,
          cart_id: self.id)
      end
      new_item
   end

   def get_quantity(id)
     @current_item = cart_items.find_by(item_id: id)
     @current_item.quantity
   end

end
