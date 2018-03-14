  require 'pg'

task :test_database_setup do

  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE links;")

  connection.exec("INSERT INTO links (url) VALUES('http://www.google.com');")
  connection.exec("INSERT INTO links (url) VALUES('http://www.twitter.com');")
  connection.exec("INSERT INTO links (url) VALUES('http://www.facebook.com');")
end

task :setup do

  connection = PG.connect
  connection.exec("CREATE DATABASE bookmark_mangaer;")
  connection.exec("CREATE DATABASE bookmark_mangaer_test;")

  conneciton = PG.connect(dbname: 'bookmark_manager')
  connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60))")

  conneciton = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60))")
end
