# frozen_string_literal: true

module Playlists
  class UpdatePlaylistService
    include Callable

    attr_reader :playlist_params

    def initialize(playlist_params)
      @playlist_params = playlist_params
    end

    def call
      playlist = Playlist.find_by!(playlist_params.extract!(:id))

      OpenStruct.new(success: playlist.update(playlist_params), errors: playlist.errors, playlist: playlist)
    end
  end
end
