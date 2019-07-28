require 'net/http'
require 'json'

puts "Please enter your location:"
location = gets.strip.capitalize
url = "http://api.openweathermap.org/data/2.5/weather?q=#{location}&APPID=#{ENV["API_KEY"]}"
uri = URI(url)

loop do
  response = Net::HTTP.get(uri)
  weather_id = JSON.parse(response)["weather"][0]["id"]
  weather = JSON.parse(response)["weather"][0]["main"]
  File.write("weather.txt", weather_id)
  puts "Weather updated (-> id: #{weather})"
  minutes = 60 # (seconds)
  sleep(1 * minutes)
end