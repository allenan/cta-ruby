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

describe Cta::Alerts::Details do
  let(:details) { described_class.new routeid: 'red,p' }
  let(:first_alert) { details.alerts.first }

  it "should return an error code of 0" do
    details.error_code.should be(0)
  end

  it "should have alert id" do
    first_alert.alert_id.should be_a(Integer)
  end

  it "should have headline" do
    first_alert.headline.should be_a(String)
  end

  it "should have short description" do
    first_alert.short_description.should be_a(String)
  end 

  it "should have full_description" do
    first_alert.full_description.should be_a(String)
  end 

  it "should have severity_score" do
    first_alert.severity_score.should be_a(Integer)
  end 

  it "should have impact" do
    first_alert.impact.should be_a(String)
  end 

  it "should have event_start" do
    first_alert.event_start.should be_a(Time)
  end 

  it "should have event_end, or nil" do
    first_alert.event_end.should satisfy{|s| s.is_a?(Date) || s.nil?}
  end  

  # it "should have tbd" do
  #   first_alert.tbd.should be_true or first_alert.tbd.should be_false
  # end

  # it "should have major_alert" do
  #   first_alert.major_alert.should be_true or first_alert.major_alert.should be_false
  # end  

  it "should have routes affected" do
    first_alert.routes_affected.first.name.should be_a(String)
  end  

  it "should have headline" do
    first_alert.headline.should be_a(String)
  end  
end