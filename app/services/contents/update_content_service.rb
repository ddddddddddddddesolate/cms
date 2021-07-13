# frozen_string_literal: true

module Contents
  class UpdateContentService < BaseService
    attr_reader :current_user, :content_params

    def initialize(current_user, content_params)
      @current_user = current_user
      @content_params = content_params
    end

    def call
      content = current_user.contents.find_by!(content_params.extract!(:id))

      OpenStruct.new(success: content.update(content_params), errors: content.errors, content: content)
    end
  end
end
