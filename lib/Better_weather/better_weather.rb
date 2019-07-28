require_relative './weather_update.rb'

class BetterWeather

  include WeatherUpdate

  def initialize(location = "London")
    @location = location
  end

  @@dangerous_weather_ids = [
    200, 201, 202, 210, 211, 212, 221, 230, 231, 232, # Thunderstorms
    504, 511, # Extreme Rain and Freezing Rain
    762, # Volcanic ash
    771, # Squalls
    781  # Tornado
  ]

  def stormy?
    @@dangerous_weather_ids.include? @current[:id]
  end

end