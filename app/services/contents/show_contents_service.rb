# frozen_string_literal: true

module Contents
  class ShowContentsService
    include Callable

    def call
      OpenStruct.new(contents: Content.all)
    end
  end
end
