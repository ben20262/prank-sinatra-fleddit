class CreateUserPages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_pages do |t|
      t.integer :user_id
      t.integer :page_id
      t.boolean :mod
    end
  end
end
