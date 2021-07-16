# frozen_string_literal: true

module Playlists
  # Show playlist service
  class ShowPlaylistService < BaseService
    attr_reader :id

    def initialize(current_user, id)
      super(current_user)
      @id = id
    end

    def call
      playlist  = Playlist.includes(:slides, :contents)
                          .find(id)
      authorize playlist, :show?

      OpenStruct.new(playlist: playlist)
    end
  end
end
