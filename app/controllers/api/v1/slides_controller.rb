# frozen_string_literal: true

module Api
  module V1
    class SlidesController < AuthenticatedController
      def index
        result = Slides::ShowSlidesService.call(slide_params)

        render json: {
                 data: result.slides,
               }, status: :ok
      end

      def show
        result = Slides::ShowSlideService.call(slide_params)

        render json: {
                 data: result.slide,
               }, status: :ok
      end

      def create
        result = Slides::AddSlideService.call(slide_params)

        if result.success
          render json: {
                   data: result.slide,
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      private

      def slide_params
        params.permit(:id, :playlist_id, :content_id)
      end
    end
  end
end
