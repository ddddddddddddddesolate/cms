# frozen_string_literal: true

module Contents
  class DeleteContentService < BaseService
    attr_reader :current_user, :content_params

    def initialize(current_user, content_params)
      @current_user = current_user
      @content_params = content_params
    end

    def call
      content = current_user.contents.find_by!(content_params.extract!(:id))

      content.destroy

      OpenStruct.new(success: content.destroyed?, errors: content.errors, content: content)
    end
  end
end
