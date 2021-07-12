# frozen_string_literal: true

module Slides
  class ShowSlidesService
    include Callable

    attr_reader :slide_params

    def initialize(slide_params)
      @slide_params = slide_params
    end

    def call
      slides = if slide_params[:playlist_id]
          Playlist.find_by!(id: slide_params[:playlist_id]).slides
        else
          Content.find_by!(id: slide_params[:content_id]).slides
        end

      OpenStruct.new(slides: slides)
    end
  end
end
