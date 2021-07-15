# frozen_string_literal: true

module Playlists
  # Show playlists service
  class ShowPlaylistsService < BaseService
    def call
      OpenStruct.new(playlists: policy_scope(Playlist))
    end
  end
end
