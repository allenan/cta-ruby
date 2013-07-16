module Cta
  module Alerts
    class OverviewRoute
      attr_accessor :name, :status, :route_id

      def initialize( args )
        @name = args["Route"]
        @status = args["RouteStatus"]
        @route_id = args["ServiceId"]
      end
    end
  end
end