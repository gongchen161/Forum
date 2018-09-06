class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string "first_name", :limit => 50
      t.string "last_name", :limit => 50
      t.string "email", :default => '', :null => false, :limit => 100
      t.string "password_digest"
      t.integer "level"
      t.integer "numThreads"
      t.integer "numLikes"

      t.timestamps
    end
      add_index("users", "email")
  end
end
