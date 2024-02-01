class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://api.open-meteo.com/v1/forecast?latitude=39.739235&longitude=-104.990250&current=temperature_2m&hourly=temperature_2m&daily=temperature_2m_max,temperature_2m_min'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    
  end
end
