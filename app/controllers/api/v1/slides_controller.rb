# frozen_string_literal: true

module Api
  module V1
    class SlidesController < AuthenticatedController
      def index
        result = Slides::ShowSlidesService.call(slide_params)

        render json: {
                 data: ActiveModelSerializers::SerializableResource.new(result.slides, each_serializer: SlideSerializer),
               }, status: :ok
      end

      def show
        result = Slides::ShowSlideService.call(slide_params)

        render json: {
                 data: ActiveModelSerializers::SerializableResource.new(result.slide, serializer: SlideSerializer),
               }, status: :ok
      end

      def create
        result = Slides::AddSlideService.call(slide_params)

        if result.success
          render json: {
                   data: ActiveModelSerializers::SerializableResource.new(result.slide, serializer: SlideSerializer),
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def update
        result = Slides::UpdateSlideService.call(slide_params)

        if result.success
          render json: {
                   data: ActiveModelSerializers::SerializableResource.new(result.slide, serializer: SlideSerializer),
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Slides::DeleteSlideService.call(slide_params)

        if result.success
          render status: :no_content
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      private

      def slide_params
        params.permit(:id, :playlist_id, :content_id, :weight)
      end
    end
  end
end