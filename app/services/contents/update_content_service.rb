# frozen_string_literal: true

module Contents
  class UpdateContentService < BaseService
    attr_reader :current_user, :id, :content_params

    def initialize(current_user, id, content_params)
      @current_user = current_user
      @id = id
      @content_params = content_params
    end

    def call
      content = Content.find(id)
      authorize content, :update?

      OpenStruct.new(success: content.update(content_params), errors: content.errors, content: content)
    end
  end
end
