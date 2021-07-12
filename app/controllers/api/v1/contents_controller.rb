# frozen_string_literal: true

module Api
  module V1
    class ContentsController < AuthenticatedController
      def index
        result = Contents::ShowContentsService.call

        render json: {
                 data: result.contents,
               }, status: :ok
      end

      def show
        result = Contents::ShowContentService.call(content_params)

        render json: {
                 data: result.content,
               }, status: :ok
      end

      def create
        result = Contents::CreateContentService.call(content_params)

        if result.success
          render json: {
                   data: result.content,
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def update
        result = Contents::UpdateContentService.call(content_params)

        if result.success
          render json: {
                   data: result.content,
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
