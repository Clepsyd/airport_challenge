class Better_weather

  @@dangerous_weather_ids = [
    200, 201, 202, 210, 211, 212, 221, 230, 231, 232, # Thunderstorms
    504, 511, # Extreme Rain and Freezing Rain
    762, # Volcanic ash
    771, # Squalls
    781  # Tornado
  ]

  def stormy?
    @@dangerous_weather_ids.include? File.read("weather.txt").to_i
  end

end