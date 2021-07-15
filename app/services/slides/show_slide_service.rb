# frozen_string_literal: true

module Slides
  # Show slide service
  class ShowSlideService < BaseService
    attr_reader :slide_params

    def initialize(current_user, slide_params)
      super(current_user)
      @slide_params = slide_params
    end

    def call
      authorize Playlist.find(slide_params[:playlist_id]), :use?

      slide = Slide.includes(:content)
                   .find_by!(slide_params)

      OpenStruct.new(slide: slide)
    end
  end
end
