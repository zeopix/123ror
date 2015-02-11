require 'open-uri'
require 'json'
class Sport

  SportInstance = Struct.new(:id, :slug, :name, :hex, :to_label)

  def self.all
    (JSON.parse open("http://www.betvictor.com/live/en/live/list.json").read, :proxy => ENV['PROXIES_LIST'].split(",").sample).sports
  end
end
