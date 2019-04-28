class User < ApplicationRecord
    has_many :posts, dependent: :nullify
    has_many :comments, dependent: :nullify
    
    has_secure_password

    validates(
        :name,
        length: { minimum: 2 },
        uniqueness: true
    )

    validates(
        :email,
        presence: true,
        uniqueness: true,
        format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    )

    validates(:password_digest, presence: true)
end
