class Page < ActiveRecord::Base
    validates_presence_of :name, :about
    has_many :users, through: :users_pages
end