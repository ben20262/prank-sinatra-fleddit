class UsersPages < ActiveRecord::Migration[6.0]
  def change
    create_table :users_pages do |t|
      t.integer :user_id
      t.integer :page_id
    end
  end
end
