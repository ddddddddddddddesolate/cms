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

      def show
        result = Events::ShowEventService.call(current_user, event_params)

        render json: {
                 data: result.event,
               }, status: :ok
      end

      def create
        result = Events::CreateEventService.call(current_user, event_params)

        if result.success
          render json: {
                   data: result.event,
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      private

      def event_params
        params.permit(:id, :name)
      end
    end
  end
end
