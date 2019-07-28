module WeatherUpdate

  attr_reader :current, :location
  
  require 'net/http'
  require 'json'

  def fetch
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{@location}&APPID=#{ENV["API_KEY"]}"
    uri = URI(url)
    return Net::HTTP.get(uri)
  end

  def parse
    parsed = JSON.parse(fetch)
    id = parsed["weather"][0]["id"]
    main = parsed["weather"][0]["main"]
    return { id: id, main: main }
  end

  def update
    @current = parse if cooldown_elapsed
    @last_update_time = Time.now.to_i
  end
  
  private
  def cooldown_elapsed
    Time.now.to_i - @last_update_time > 60 if @last_update_time
    true
  end

end
