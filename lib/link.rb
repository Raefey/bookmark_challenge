require 'pg'
require_relative 'database_connection'

class Link

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.create(specs)
    return false unless valid?(specs[:url])
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES ('#{specs[:url]}', '#{specs[:title]}');")
  end

  def self.delete(title)
    DatabaseConnection.query("DELETE FROM links WHERE title='#{title}'")
  end

  private
  def self.valid?(url)
    url.include?("http://") || url.include?("https://")
  end
end
