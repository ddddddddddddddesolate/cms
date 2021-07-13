# frozen_string_literal: true

module Slides
  class AddSlideService < BaseService
    attr_reader :slide_params

    def initialize(slide_params)
      @slide_params = slide_params
    end

    def call
      slide = Slide.new(slide_params)

      OpenStruct.new(success: slide.save, errors: slide.errors, slide: slide)
    end
  end
end
