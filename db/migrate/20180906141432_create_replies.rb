class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|

      t.integer "post_id"
      t.integer "user_id"
      t.string "content"
      t.integer "numLikes"

      t.timestamps
    end
     add_index("replies", "post_id")
     add_index("replies", "user_id")
  end
end
