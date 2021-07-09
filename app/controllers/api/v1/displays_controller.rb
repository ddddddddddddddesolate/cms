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

      def create
        result = Displays::CreateDisplayService.call(current_user, display_params)

        if result.success
          render json: {
                   data: result.display,
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def update
        result = Displays::UpdateDisplayService.call(current_user, display_params)

        if result.success
          render json: {
                   data: result.display,
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Displays::DeleteDisplayService.call(current_user, display_params)

        if result.success
          render status: :no_content
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      private

      def display_params
        params.permit(:id, :name, :event_id, :playlist_id)
      end
    end
  end
end
