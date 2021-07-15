# frozen_string_literal: true

module Slides
  class ShowSlidesService < BaseService
    attr_reader :current_user, :slide_params

    def initialize(current_user, slide_params)
      @current_user = current_user
      @slide_params = slide_params
    end

    def call
      playlist = Playlist.find(slide_params[:playlist_id])
      authorize playlist, :use?
      slides = Slide.where(slide_params)

      OpenStruct.new(slides: slides)
    end
  end
end
