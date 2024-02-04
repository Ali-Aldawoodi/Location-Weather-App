class Location < ApplicationRecord
    has_many :forecasts, class_name: 'Forecast'

    validates :name, presence: true
end
