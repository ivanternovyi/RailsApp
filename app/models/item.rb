class Item < ApplicationRecord 
    validates :price, numericality: {greater_than: 0, allow_nil: true}
    validates :name, presence: true
    
  #  after_initialize { puts "init"}
#    after_save {puts "save"}
 #   after_create {puts "create"}
  #  after_update {puts "update"}
   # after_destroy {puts "destroy"}
end
