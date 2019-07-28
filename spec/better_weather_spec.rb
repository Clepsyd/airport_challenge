require 'Better_weather/better_weather'

describe BetterWeather do

  let(:stormy_weather) { { id: 200, main: "Thunderstorm" } }
  let(:sunny_weather) { { id: 800, main: "Clear" } }

  describe "#stormy?" do

    it "should return true when the weather is stormy" do
      allow(subject).to receive(:parse).and_return(stormy_weather)
      subject.update
      expect(subject).to be_stormy
    end

    it "should return false when the weather is stormy" do
      allow(subject).to receive(:parse).and_return(sunny_weather)
      subject.update
      expect(subject).not_to be_stormy
    end

  end

end
