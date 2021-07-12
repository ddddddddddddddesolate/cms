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

      private

      def slide_params
        params.permit(:id, :playlist_id, :content_id)
      end
    end
  end
end
