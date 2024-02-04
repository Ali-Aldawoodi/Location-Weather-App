class Forecast < ApplicationRecord
    belongs_to :location

    validates :date, presence: true
    validates :high_temp, presence: true
    validates :low_temp, presence: true
end
