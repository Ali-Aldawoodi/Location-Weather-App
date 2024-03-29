class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    # finds city name from user input in views file. extracts the name, latitude, and longitude from the api
    def find_city(name)
      uri = URI("https://geocoding-api.open-meteo.com/v1/search?name=#{URI.encode_www_form_component(name)}&count=1&language=en&format=json")  

      res = Net::HTTP.get_response(uri)
      result = JSON.parse(res.body)
        location = result['results'][0]

        @city_name = location['name']
        latitude = location['latitude']
        longitude = location['longitude']

        [latitude, longitude]
    end

    #Uses the above latitude and longitude and plugs in to this api in order to find weather for the entered city. Extracts the time and weather information
    def fetch_weather(latitude, longitude)
      uri = URI("https://api.open-meteo.com/v1/forecast?latitude=#{latitude}&longitude=#{longitude}&current=temperature_2m,apparent_temperature,precipitation,wind_speed_10m&daily=temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch&timezone=America%2FDenver")
      

      res = Net::HTTP.get_response(uri)
      @weather_data = JSON.parse(res.body)
      @current_temp = @weather_data['current']['temperature_2m']
      @current_precip = @weather_data['current']['precipitation']
      @current_wind_speed = @weather_data['current']['wind_speed_10m']

      daily_data = @weather_data['daily']
      @time = daily_data['time']
      @max_temp = daily_data['temperature_2m_max']
      @min_temp = daily_data['temperature_2m_min']

     
      @orders = []
        @time.each_with_index do |time, index|
          min_temp = @min_temp[index]
          max_temp = @max_temp[index]
          current_temp = ((min_temp + max_temp) / 2.0).round(1)
          order = "Date: #{time}, Max Temperature:#{max_temp} Min Temperature:#{min_temp}, Current Temperature: #{current_temp}"
          @orders << order
    end
     
    # hash below creates a variable with a hash of the daily info. This is then plugged in to the main method to find the current temperature.
      # @daily_forecast = {
      #   'time' => daily_data['time'],
      #   'temperature_2m-max' => daily_data['temperature_2m_max'].map {|day_data| day_data},
      #   'temperature_2m_min' => daily_data['temperature_2m_min'].map {|day_data| day_data}

      # }
      #   [@current_temp, @daily_forecast]
    end
   
    def main
      if params[:query].present?
        latitude, longitude = find_city(params[:query])
        @coordinates = latitude,longitude
        current_temp, daily_forecast = fetch_weather(latitude, longitude)
        
      end
    end
    main
  end
end