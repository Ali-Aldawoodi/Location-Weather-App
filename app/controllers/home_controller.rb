class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://api.open-meteo.com/v1/forecast?latitude=39.739235&longitude=-104.990250&current=temperature_2m&hourly=&daily=temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch&timezone=America%2FDenver'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    
  end
end