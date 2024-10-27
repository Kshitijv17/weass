class User < ApplicationRecord
    has_many :product,dependent: :destroy
  
end
