# frozen_string_literal: true

module Playlists
  class CreatePlaylistService
    include Callable

    attr_reader :playlist_params

    def initialize(playlist_params)
      @playlist_params = playlist_params
    end

    def call
      playlist = Playlist.new(playlist_params)

      OpenStruct.new(success: playlist.save, errors: playlist.errors, playlist: playlist)
    end
  end
end
