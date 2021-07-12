# frozen_string_literal: true

module Slides
  class DeleteSlideService
    include Callable

    attr_reader :slide_params

    def initialize(slide_params)
      @slide_params = slide_params
    end

    def call
      slide = Slide.find_by!(slide_params)

      slide.destroy

      OpenStruct.new(success: slide.destroyed?, errors: slide.errors, slide: slide)
    end
  end
end
