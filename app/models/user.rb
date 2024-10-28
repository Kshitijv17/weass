class User < ApplicationRecord
    has_many :product,dependent: :destroy
  
    has_one :user_profile
end
