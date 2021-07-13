# frozen_string_literal: true

module Api
  module V1
    class ContentsController < AuthenticatedController
      def index
        result = Contents::ShowContentsService.call(current_user)

        render json: {
                 data: ActiveModelSerializers::SerializableResource.new(result.contents, each_serializer: ContentSerializer),
               }, status: :ok
      end

      def show
        result = Contents::ShowContentService.call(current_user, content_params)

        render json: {
                 data: ActiveModelSerializers::SerializableResource.new(result.content, serializer: ContentSerializer),
               }, status: :ok
      end

      def create
        result = Contents::CreateContentService.call(current_user, content_params)

        if result.success
          render json: {
                   data: ActiveModelSerializers::SerializableResource.new(result.content, serializer: ContentSerializer),
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def update
        result = Contents::UpdateContentService.call(current_user, content_params)

        if result.success
          render json: {
                   data: ActiveModelSerializers::SerializableResource.new(result.content, serializer: ContentSerializer),
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Contents::DeleteContentService.call(content_params)

        if result.success
          render status: :no_content
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      private

      def content_params
        params.permit(:id, :content)
      end
    end
  end
end
