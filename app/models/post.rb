class Post < ActiveRecord::Base
    validates_presence_of :content, :user_id, :page_id
    belongs_to :pages
    belongs_to :users
end