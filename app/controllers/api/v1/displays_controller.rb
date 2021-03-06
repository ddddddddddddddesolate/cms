# frozen_string_literal: true

module Api
  module V1
    # Displays controller
    class DisplaysController < AuthenticatedController
      def index
        result = Displays::ShowDisplaysService.call(current_user, params[:event_id])

        render json: {
          data: ActiveModelSerializers::SerializableResource.new(result.displays, each_serializer: DisplaySerializer)
        }, status: :ok
      end

      def show
        result = Displays::ShowDisplayService.call(current_user, params[:event_id], params[:id])

        render json: {
          data: ActiveModelSerializers::SerializableResource.new(result.display, serializer: DisplaySerializer)
        }, status: :ok
      end

      def create
        result = Displays::CreateDisplayService.call(current_user, params[:event_id], display_params)

        if result.success
          render json: {
            data: ActiveModelSerializers::SerializableResource.new(result.display, serializer: DisplaySerializer)
          }, status: :ok
        else
          render json: {
            errors: result.errors
          }, status: :unprocessable_entity
        end
      end

      def update
        result = Displays::UpdateDisplayService.call(current_user, params[:event_id], params[:id], display_params)

        if result.success
          render json: {
            data: ActiveModelSerializers::SerializableResource.new(result.display, serializer: DisplaySerializer)
          }, status: :ok
        else
          render json: {
            errors: result.errors
          }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Displays::DeleteDisplayService.call(current_user, params[:event_id], params[:id])

        if result.success
          render status: :no_content
        else
          render json: {
            errors: result.errors
          }, status: :unprocessable_entity
        end
      end

      private

      def display_params
        params.permit(:name, :playlist_id)
      end
    end
  end
end
