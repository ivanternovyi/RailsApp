module CartHelper

   def get_total_for(item)
     return item.price * @cart.get_quantity(item)
   end

   def get_full_price(items)
     total = 0
     items.each do |i|
       total += get_total_for(i)
     end
     total
   end

end
