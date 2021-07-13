# frozen_string_literal: true

module Slides
  class ShowSlideService < BaseService
    attr_reader :slide_params

    def initialize(slide_params)
      @slide_params = slide_params
    end

    def call
      slide = Slide.find_by!(slide_params)

      OpenStruct.new(slide: slide)
    end
  end
end
