class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    def find_city(name)
      uri = URI("https://geocoding-api.open-meteo.com/v1/search?name=#{URI.encode_www_form_component(name)}&count=1&language=en&format=json")  

      res = Net::HTTP.get_response(uri)
      @result = JSON.parse(res.body)
        location = @result['results'][0]

        city_name = location['name']
        latitude = location['latitude']
        longitude = location['longitude']

        [latitude, longitude]
    end


    

    @url = 'https://api.open-meteo.com/v1/forecast?latitude=39.739235&longitude=-104.990250&current=temperature_2m&hourly=&daily=temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch&timezone=America%2FDenver'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output2 = JSON.parse(@response)

    
    def main
      if params[:query].present?
        latitude, longitude = find_city(params[:query])
        puts latitude,longitude
        
      end
    end
    main
  end
end