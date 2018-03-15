  require 'pg'

task :test_database_setup do

  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE links;")

  connection.exec("ALTER SEQUENCE links_id_seq RESTART WITH 1;")
  connection.exec("INSERT INTO links (url, title) VALUES('http://www.google.com', 'google');")
  connection.exec("INSERT INTO links (url, title) VALUES('http://www.twitter.com', 'twitter');")
  connection.exec("INSERT INTO links (url, title) VALUES('http://www.facebook.com', 'facebook');")
end

task :setup do

  connection = PG.connect
  connection.exec("CREATE DATABASE bookmark_manager;")
  connection.exec("CREATE DATABASE bookmark_manager_test;")

  connection = PG.connect(dbname: 'bookmark_manager')
  connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), Title VARCHAR(60))")

  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60),  Title VARCHAR(60))")
end
