module Cta
  module Alerts
    class DetailsService
      attr_accessor :name, :route_type, :route_id, :description

      def initialize( args )
        @name         = args["ServiceName"]
        @route_type   = args["ServiceType"]
        @route_id     = args["ServiceId"]
        @description  = args["Train Route"]
      end
    end

    class DetailsAlert
      attr_accessor :alert_id, :headline, :short_description, :full_description, :severity_score, :impact, :event_start, :event_end, :tbd, :major_alert, :routes_affected
      
      def initialize( args )
        @alert_id           = args["AlertId"].to_i
        @headline           = args["Headline"]
        @short_description  = args["ShortDescription"]
        @full_description   = args["FullDescription"]
        @severity_score     = args["SeverityScore"].to_i
        @impact             = args["Impact"]
        @event_start        = parse_time args["EventStart"]
        @event_end          = parse_time args["EventEnd"]
        @tbd                = string_to_bool args["TBD"]
        @major_alert        = string_to_bool args["MajorAlert"]
        @routes_affected    = build_routes(args["ImpactedService"]["Service"])
      end

      private
      def ensure_array input
        input.kind_of?(Array) ? input : [input]
      end

      def string_to_bool string
        string == "0" ? false : true
      end

      def build_routes( hash )
        ensure_array(hash).map { |route_info| DetailsService.new route_info }
      end

      def parse_time string
        return nil if string.nil?
        Time.parse(string)
      end
    end

    class Details
      attr_accessor :error_code, :alerts
      def initialize( args )
        @response = Alerts.fetch('alerts.aspx', query: args).parsed_response
        @error_code = @response["CTAAlerts"]["ErrorCode"].to_i
        @alerts = build_alerts(@response["CTAAlerts"]["Alert"])
      end

      private
      def ensure_array input
        input.kind_of?(Array) ? input : [input]
      end

      def build_alerts hash
        ensure_array(hash).map { |alert_info| DetailsAlert.new alert_info }
      end
    end
  end
end