class Post < ApplicationRecord
    validates(
        :title, 
        presence: true,
        uniqueness: true
    )

    validates(
        :body, 
        length: { minimum: 50 }
    )
end
