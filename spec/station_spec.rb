require "station"

describe Station do
  subject { Station.new("Bank", "Zone1") }
  # subject = Station.new("Bank", "Zone1")
  it "has a name" do
    expect(subject.name).to eq "Bank"
  end

  it "has a zone" do
    expect(subject.zone).to eq "Zone1"
  end
end
