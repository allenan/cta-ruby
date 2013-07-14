require 'spec_helper'
require 'awesome_print'

describe Cta::Train do
  it "should have a base url" do
    described_class.base_url.should == "http://lapi.transitchicago.com/api/1.0/"
  end

  context '#arrivals' do
    it "should return a response" do
      arrival = Cta::Train::Arrival.new mapid: 40380, max: 5
      arrival.eta.first["staId"].should == "40380"
    end

  end
end