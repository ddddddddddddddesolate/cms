# frozen_string_literal: true

module Slides
  # Show slides service
  class ShowSlidesService < BaseService
    attr_reader :slide_params

    def initialize(current_user, slide_params)
      super(current_user)
      @slide_params = slide_params
    end

    def call
      authorize Playlist.find(slide_params[:playlist_id]), :use?

      slides = Slide.includes(:content)
                    .where(slide_params)

      OpenStruct.new(slides: slides)
    end
  end
end
