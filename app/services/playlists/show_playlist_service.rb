# frozen_string_literal: true

module Playlists
  class ShowPlaylistService < BaseService
    attr_reader :playlist_params

    def initialize(playlist_params)
      @playlist_params = playlist_params
    end

    def call
      playlist = Playlist.find_by!(playlist_params)

      OpenStruct.new(playlist: playlist)
    end
  end
end
