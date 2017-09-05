class Item < ApplicationRecord
    validates :price, numericality: {greater_than: 0}, presence: true
    validates :name, presence: true

    has_many :cart_items
    has_many :carts, through: :cart_items

    mount_uploader :image, ImageUploader

    def self.search(term, page)
      if term
        where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 10)
      else
        paginate(page: page, per_page: 10).order("votes_count DESC", "price")
      end
    end
    #callbacks
  #  after_initialize { puts "init"}
#    after_save {puts "save"}
 #   after_create {puts "create"}
  #  after_update {puts "update"}
   # after_destroy {puts "destroy"}
end
