# frozen_string_literal: true

module Api
  module V1
    class EventsController < AuthenticatedController
      def index
        result = Events::ShowEventsService.call(current_user)

        render json: {
                 data: ActiveModelSerializers::SerializableResource.new(result.events, each_serializer: EventSerializer),
               }, status: :ok
      end

      def show
        result = Events::ShowEventService.call(current_user, params[:id])

        render json: {
                 data: ActiveModelSerializers::SerializableResource.new(result.event, serializer: EventSerializer),
               }, status: :ok
      end

      def create
        result = Events::CreateEventService.call(current_user, event_params)

        if result.success
          render json: {
                   data: ActiveModelSerializers::SerializableResource.new(result.event, serializer: EventSerializer),
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def update
        result = Events::UpdateEventService.call(current_user, params[:id], event_params)

        if result.success
          render json: {
                   data: ActiveModelSerializers::SerializableResource.new(result.event, serializer: EventSerializer),
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Events::DeleteEventService.call(current_user, params[:id])

        if result.success
          render status: :no_content
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      private

      def event_params
        params.permit(:name)
      end
    end
  end
end
