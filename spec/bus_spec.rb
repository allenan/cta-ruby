require 'spec_helper'
require 'awesome_print'

describe Cta::Bus do
  it "should have a base url" do
    described_class.base_url.should == "http://www.ctabustracker.com/bustime/api/v1/"
  end
end

describe Cta::Bus::Arrival do
  let(:arrival) { described_class.new stop_ids: [14693, 14692] }
  let(:first_prediction) { arrival.predictions.first }

  it "should have a destination" do
    first_prediction.destination.should be_a(String)
  end
end