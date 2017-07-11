class User < ApplicationRecord
    validates :password, length: {minimum: 6}
    validates :login, :password, presence: true
    
    has_one :cart
    has_many :orders
    
end
