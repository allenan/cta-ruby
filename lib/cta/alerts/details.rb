module Cta
  module Alerts
    class Details
      attr_accessor :error_code, :routes
      def initialize( args )
        @response = Alerts.fetch('alerts.aspx', query: args).parsed_response
        @error_code = @response["CTARoutes"]["ErrorCode"].to_i
        # @routes = build_routes(@response["CTARoutes"]["RouteInfo"])
      end

      private
      def ensure_array input
        input.kind_of?(Array) ? input : [input]
      end

      def build_routes hash
        ensure_array(hash).map { |route_info| OverviewRoute.new route_info }
      end
    end
  end
end