# frozen_string_literal: true

module Contents
  class ShowContentService < BaseService
    attr_reader :current_user, :content_params

    def initialize(current_user, content_params)
      @current_user = current_user
      @content_params = content_params
    end

    def call
      content = current_user.contents.find_by!(@content_params)

      OpenStruct.new(content: content)
    end
  end
end
