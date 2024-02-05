class Location < ApplicationRecord
    attribute :city_name, :string
    attribute :max_temperature, :float
    attribute :min_temperature, :float
    attribute :current_temperature, :float
end
