module Cta
  module Alerts
    include HTTParty
    def self.base_url
      "http://www.transitchicago.com/api/1.0/"
    end

    def self.fetch(url_appendage, opts)
      get(base_url + url_appendage, opts)
    end
  end
end