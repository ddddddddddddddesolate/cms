# frozen_string_literal: true

module Api
  module V1
    class ContentsController < ApplicationController
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

      private

      def content_params
        params.permit(:content)
      end
    end
  end
end
