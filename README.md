# README

* Database creation
  1. The default database management system used is mysql
  2. The default databases that need to be created are `forum_development` and `forum_test`
  3. Make sure to `GRANT ALL PRIVILEGES` of the above databases to your users
  4. Change the username and password accordingly in "config/database.yml"

* Database initialization
  1. run `rails db:migrate` to generate all the necessary tables;

* How to run the application
  1. Run `rails server` to start the server and then go to `localhost:3000`(default destination) to       launch the home page
  2. Register or Log in to the account to create subjects and threads or post replies to the existing thread
  2. Only administrators (level > 10) can delete the posts or a replies
