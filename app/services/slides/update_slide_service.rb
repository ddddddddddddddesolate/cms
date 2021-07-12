# frozen_string_literal: true

module Slides
  class UpdateSlideService
    include Callable

    attr_reader :slide_params

    def initialize(slide_params)
      @slide_params = slide_params
    end

    def call
      slide = Slide.find_by!(slide_params.extract!(:id))

      OpenStruct.new(success: slide.update(slide_params), errors: slide.errors, slide: slide)
    end
  end
end
