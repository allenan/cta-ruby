require 'spec_helper'

describe Cta::Config do
  describe '.setup' do
    it 'assigns the options hash values to constants in the Cta namespace that correspond to key values' do
      Cta::Config.setup :api_key => "hello"
      Cta.const_get('API_KEY').should == "hello"
    end
  end
end 