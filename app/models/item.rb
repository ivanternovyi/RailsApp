class Item < ApplicationRecord
    validates :price, numericality: {greater_than: 0, allow_nil: true}
    validates :name, presence: true

    has_many :positions
    has_many :carts, through: :positions

    has_many :comments, as: :commentable

    mount_uploader :image, ImageUploader
    #callbacks
  #  after_initialize { puts "init"}
#    after_save {puts "save"}
 #   after_create {puts "create"}
  #  after_update {puts "update"}
   # after_destroy {puts "destroy"}
end
