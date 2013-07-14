module Cta
  module Train
    class Arrival
      attr_accessor :mapid, :stpid, :max, :rt, :response

      def initialize( args )
        @mapid = args[:mapid]
        @max = args[:max]
        options = args.merge key: TRAIN_API_KEY
        @response = Train.fetch('ttarrivals.aspx', query: options).parsed_response
      end

      def eta
        @response["ctatt"]["eta"]
      end

      private

    end
  end
end