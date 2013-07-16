require 'spec_helper'
require 'awesome_print'

describe Cta::Alerts do
  it "should have a base url" do
    described_class.base_url.should == "http://www.transitchicago.com/api/1.0/"
  end


end

describe Cta::Alerts::Overview do

  let(:overview) { described_class.new routeid: 'red,p' }
  let(:first_route) { overview.routes.first }

  it "should return an error code of 0" do
    overview.error_code.should be(0)
  end

  it "should return the route's name" do
    first_route.name.should == "Red Line"
  end

  it "should return route's status" do
    first_route.status.should be_a(String)
  end

  it "should return route_id" do
    first_route.route_id.should be_a(String)
  end
end

# describe Cta::Alerts::Details do
#   it "should description" do
    
#   end
# end