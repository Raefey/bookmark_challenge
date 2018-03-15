require 'pg'
require_relative 'database_connection'

class Link

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def self.create(specs)
    return false unless valid?(specs)
    DatabaseConnection.query("INSERT INTO links (url) VALUES ('#{specs[:url]}');")
  end

  private
  def self.valid?(specs)
    specs[:url].include?("http://") || specs[:url].include?("https://")
  end
end
