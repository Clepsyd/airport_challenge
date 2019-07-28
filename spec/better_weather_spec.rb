require 'Better_weather/better_weather'

describe BetterWeather do

  let(:stromy_weather) { {"weather": [{"id": 200, "main": "Thunderstorm"}]} }
  let(:sunny_weather) { {"weather": [{"id": 800, "main": "Clear"}]} }
  
  describe "#stormy?" do

    it "should return true when the weather is stormy" do
      allow(subject).to receive(:current).and_return(stromy_weather)
      expect(subject).to be_stormy
    end

    it "should return false when the weather is stormy" do
      allow(subject).to receive(:current).and_return(sunny_weather)
      expect(subject).not_to be_stormy
    end

  end

end
