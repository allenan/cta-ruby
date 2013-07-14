require "httparty"
Dir[File.dirname(__FILE__) + '/cta/*.rb'].each do |file|
  require file
end

Dir[File.dirname(__FILE__) + '/cta/train/*.rb'].each do |file|
  require file
end