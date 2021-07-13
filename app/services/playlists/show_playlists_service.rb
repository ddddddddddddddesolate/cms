# frozen_string_literal: true

module Playlists
  class ShowPlaylistsService < BaseService
    def call
      OpenStruct.new(playlists: Playlist.all)
    end
  end
end
