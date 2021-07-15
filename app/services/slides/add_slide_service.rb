# frozen_string_literal: true

module Slides
  class AddSlideService < BaseService
    attr_reader :current_user, :slide_params

    def initialize(current_user, slide_params)
      @current_user = current_user
      @slide_params = slide_params
    end

    def call
      playlist = Playlist.find(slide_params[:playlist_id])
      authorize playlist, :use?
      content = Content.find(slide_params[:content_id])
      authorize content, :use?
      slide = Slide.new(slide_params)

      OpenStruct.new(success: slide.save, errors: slide.errors, slide: slide)
    end
  end
end
