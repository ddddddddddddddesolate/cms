# frozen_string_literal: true

module Slides
  # Update slide service
  class UpdateSlideService < BaseService
    attr_reader :slide_params

    def initialize(current_user, slide_params)
      super(current_user)
      @slide_params = slide_params
    end

    def call
      playlist = Playlist.find(slide_params[:playlist_id])
      authorize playlist, :use?

      slide = Slide.includes(:content)
                   .find_by!(slide_params.extract!(:id))

      OpenStruct.new(success: slide.update(slide_params), errors: slide.errors, slide: slide)
    end
  end
end
