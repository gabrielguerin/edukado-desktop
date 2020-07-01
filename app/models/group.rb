class Group < ApplicationRecord
    # Associations

    has_many :users

    has_many :posts  
end
