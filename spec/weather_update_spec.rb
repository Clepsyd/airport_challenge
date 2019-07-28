require 'Better_weather/weather_update'

class WeatherUpdateContainer
  include WeatherUpdate
end

describe WeatherUpdateContainer do

  it { is_expected.to respond_to(:current,
                                 :update,
                                 :fetch)
  }

  let(:json_double) { '{"weather": [{"id": 500, "main": "Rain"}]}' }
  let(:location) { "London" }

  describe "#fetch" do

    it "returns a string" do
      expect(subject.fetch).to be_a(String)
    end

  end

  describe "#parse" do

    it "returns an id/weather pair" do
      allow(subject).to receive(:fetch).and_return(json_double)
      expect(subject.parse).to eq({ id: 500, main: "Rain" })
    end

  end

  describe "#update" do

    it "updates the current weather" do
      last_update = 1_564_323_747
      allow(subject).to receive(:last_update_time).and_return(last_update)
      old_data = { "weather": [{ "id": 200, "main": "Thunderstorm" }] }
      allow(subject).to receive(:fetch).and_return(json_double)
      subject.update
      expect(subject.current).not_to eq(old_data)
    end
    
  end

end
