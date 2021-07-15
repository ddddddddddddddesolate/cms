# frozen_string_literal: true

module Slides
  # Add slide service
  class CreateSlideService < BaseService
    attr_reader :slide_params

    def initialize(current_user, slide_params)
      super(current_user)
      @slide_params = slide_params
    end

    def call
      authorize Playlist.find(slide_params[:playlist_id]), :use?
      authorize Content.find(slide_params[:content_id]), :use?

      slide = Slide.includes(:content)
                   .new(slide_params)

      OpenStruct.new(success: slide.save, errors: slide.errors, slide: slide)
    end
  end
end
