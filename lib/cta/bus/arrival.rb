module Cta
  module Bus
    class Arrival
      attr_accessor :predictions

      def initialize( args )
        options = {}
        options["stpid"] = args[:stop_ids].join(",")
        options = options.merge key: BUS_API_KEY
        @response = Bus.fetch('getpredictions', query: options).parsed_response
        @predictions = build_predictions(@response)
      end


      private
      def build_predictions( hash )
        hash["bustime_response"]["prd"].map { |prd| Prediction.new prd }
      end
    end

    class Prediction
      attr_accessor :timestamp, :predicted_time, :stop_name, :vid, :route_id, :route_direction, :destination

      def initialize( args )
        @timestamp        = Time.parse(args["tmstmp"])
        @predicted_time   = Time.parse(args["prdtm"])
        @stop_name        = args["stpnm"]
        @vid              = args["vid"]
        @route_id         = args["rt"]
        @route_direction  = args["rtdir"]
        @destination      = args["des"]
      end
    end
  end
end