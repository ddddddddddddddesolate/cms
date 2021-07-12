# frozen_string_literal: true

module Slides
  class ShowSlidesService
    include Callable

    attr_reader :slide_params

    def initialize(slide_params)
      @slide_params = slide_params
    end

    def call
      slides = Slide.where(slide_params)

      OpenStruct.new(slides: slides)
    end
  end
end
