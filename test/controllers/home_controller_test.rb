require "test_helper"
require 'rails_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end
end

RSpec.describe HomeController, type: :controller do

  describe '#find_city' do
    it 'returns latitude and longitude' do
      city_name = 'New York'
      latitude = 40.7128
      longitude = -74.0060

      result = subject.find_city(city_name)

    end
  end

  describe '#fetch_weather' do
    it 'returns weather data ' do
      latitude = 40.7128
      longitude = -74.0060

      subject.fetch_weather(latitude, longitude)

    end
  end
end
