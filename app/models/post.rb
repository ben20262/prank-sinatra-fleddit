class Post < ActiveRecord::Base
    validates_presence_of :content, :user_id, :page_id
    belongs_to :page
    belongs_to :user
end