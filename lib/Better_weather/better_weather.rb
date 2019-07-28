require_relative './weather_update.rb'

class BetterWeather

  include WeatherUpdate

  def initialize(location = "London")
    @location = location
  end

  # Thunderstorms
  @@stormy_ids = [200, 201, 202, 210, 211, 212, 221, 230, 231, 232]

  def stormy?
    @@stormy_ids.include? @current[:id]
  end

end
