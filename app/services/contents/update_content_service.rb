# frozen_string_literal: true

module Contents
  class UpdateContentService
    include Callable

    attr_reader :content_params

    def initialize(content_params)
      @content_params = content_params
    end

    def call
      content = Content.find_by!(content_params.extract!(:id))

      OpenStruct.new(success: content.update(content_params), errors: content.errors, content: content)
    end
  end
end
