class Page < ActiveRecord::Base
    validates_presence_of :name, :about
    validates_uniqueness_of :name
    has_many :posts
    has_many :user_pages
    has_many :users, through: :user_pages
end