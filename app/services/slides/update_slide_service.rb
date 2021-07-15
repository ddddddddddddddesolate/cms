# frozen_string_literal: true

module Slides
  class UpdateSlideService < BaseService
    attr_reader :current_user, :slide_params

    def initialize(current_user, slide_params)
      @current_user = current_user
      @slide_params = slide_params
    end

    def call
      playlist = Playlist.find(slide_params[:playlist_id])
      authorize playlist, :use?
      slide = Slide.find_by!(slide_params.extract!(:id))

      OpenStruct.new(success: slide.update(slide_params), errors: slide.errors, slide: slide)
    end
  end
end
