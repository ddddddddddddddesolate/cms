# frozen_string_literal: true

module Api
  module V1
    # Slides controller
    class SlidesController < AuthenticatedController
      def index
        result = Slides::ShowSlidesService.call(current_user, slide_params)

        render json: {
          data: ActiveModelSerializers::SerializableResource.new(result.slides, each_serializer: SlideSerializer)
        }, status: :ok
      end

      def show
        result = Slides::ShowSlideService.call(current_user, slide_params)

        render json: {
          data: ActiveModelSerializers::SerializableResource.new(result.slide, serializer: SlideSerializer)
        }, status: :ok
      end

      def create
        result = Slides::CreateSlideService.call(current_user, slide_params)

        if result.success
          render json: {
            data: ActiveModelSerializers::SerializableResource.new(result.slide, serializer: SlideSerializer)
          }, status: :ok
        else
          render json: {
            errors: result.errors
          }, status: :unprocessable_entity
        end
      end

      def update
        result = Slides::UpdateSlideService.call(current_user, slide_params)

        if result.success
          render json: {
            data: ActiveModelSerializers::SerializableResource.new(result.slide, serializer: SlideSerializer)
          }, status: :ok
        else
          render json: {
            errors: result.errors
          }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Slides::DeleteSlideService.call(current_user, slide_params)

        if result.success
          render status: :no_content
        else
          render json: {
            errors: result.errors
          }, status: :unprocessable_entity
        end
      end

      private

      def slide_params
        params.permit(:id, :name, :playlist_id, :content_id, :weight)
      end
    end
  end
end
