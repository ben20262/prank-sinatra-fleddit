class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :page_id
      t.integer :user_id
      t.integer :upvote
      t.timestamps
    end
  end
end
