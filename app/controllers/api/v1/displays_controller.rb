# frozen_string_literal: true

module Api
  module V1
    class DisplaysController < AuthenticatedController
      def index
        result = Displays::ShowDisplaysService.call(current_user, display_params)

        render json: {
                 data: result.displays,
               }, status: :ok
      end

      def show
        result = Displays::ShowDisplayService.call(current_user, display_params)

        render json: {
                 data: result.display,
               }, status: :ok
      end

      private

      def display_params
        params.permit(:id, :event_id, :name)
      end
    end
  end
end
