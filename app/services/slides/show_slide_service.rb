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
      playlist = Playlist.find(slide_params[:playlist_id])
      authorize playlist, :use?
      slide = Slide.find_by!(slide_params)

      OpenStruct.new(slide: slide)
    end
  end
end
