class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer "subject_id"
      t.integer "user_id"
      t.string "title", :limit => 100
      t.text "content"
      t.integer "numReplies"
      t.integer "numLikes"

      t.timestamps
    end
      add_index("posts", "subject_id")
      add_index("posts", "user_id")
  end
end
