# frozen_string_literal: true

module Contents
  class CreateContentService
    include Callable

    attr_reader :content_params

    def initialize(content_params)
      @content_params = content_params
    end

    def call
      content = Content.new(content_params)

      OpenStruct.new(success: content.save, errors: content.errors, content: content)
    end
  end
end
