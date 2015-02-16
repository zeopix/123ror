require 'open-uri'
require 'json'
class SportsController < ApplicationController
  def index
    render :json => open("http://www.betvictor.com/live/en/live/list.json",:proxy => 'http://82.146.147.112:80').read
  end
end
