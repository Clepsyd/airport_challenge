describe WeatherUpdate do

  it { is_expected.to respond_to(:current,
                                 :update,
                                 :fetch)
  }

  let(:json_double) { '{"weather": [{"id": 500, "main": "Rain"}]' }

  describe "#fetch" do

    it "returns a string" do
      expect(WeatherUpdate.fetch).to be_a(String)
    end

  end

  describe "#parse" do

    it "returns an id/weather pair" do
      allow(WeatherUpdate).to receive(:fetch).and_return(json_double)
      expect(WeatherUpdate.parse).to eq({id: 500, main: "Rain"})
    end

  end

  describe "#update" do

    it "updates the current weather" do
      weather_before = WeatherUpdate.current
      allow(WeatherUpdate).to receive(:fetch).and_return(json_double)
      WeatherUpdate.update
      expect(WeatherUpdate.current).not_to eq(weather_before)
    end
    
  end

end