# frozen_string_literal: true

module Playlists
  class ShowPlaylistsService
    include Callable

    def call
      OpenStruct.new(playlists: Playlist.all)
    end
  end
end
