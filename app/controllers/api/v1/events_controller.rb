# frozen_string_literal: true

module Api
  module V1
    class EventsController < AuthenticatedController
      def index
        result = Events::ShowEventsService.call(current_user)

        render json: {
                 data: result.events,
               }, status: :ok
      end
    end
  end
end
