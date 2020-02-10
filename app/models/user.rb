class User < ActiveRecord::Base
    validates_presence_of :username, :email
    has_secure_password
    has_many :posts
    has_many :user_pages
    has_many :pages, through: :user_pages
end