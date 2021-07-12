# frozen_string_literal: true

module Contents
  class DeleteContentService
    include Callable

    attr_reader :content_params

    def initialize(content_params)
      @content_params = content_params
    end

    def call
      content = Content.find_by!(content_params.extract!(:id))

      content.destroy

      OpenStruct.new(success: content.destroyed?, errors: content.errors, content: content)
    end
  end
end
