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
      authorize Playlist.find(id), :show?

      playlist  = Playlist.includes(:slides, :contents)
                          .find(id)

      OpenStruct.new(playlist: playlist)
    end
  end
end
