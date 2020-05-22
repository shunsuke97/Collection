class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string  :text,              null: false
      t.string  :title,             null: false
      t.string  :image,             null: false
      t.string  :author,            null: false
      t.text    :introduction,      null: false
      t.integer :user_id,           null: false
      t.timestamps
    end
  end
end
