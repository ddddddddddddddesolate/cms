# frozen_string_literal: true

module Playlists
  class DeletePlaylistService
    include Callable

    attr_reader :playlist_params

    def initialize(playlist_params)
      @playlist_params = playlist_params
    end

    def call
      playlist = Playlist.find_by!(playlist_params)

      playlist.destroy

      OpenStruct.new(success: playlist.destroyed?, errors: playlist.errors, playlist: playlist)
    end
  end
end
