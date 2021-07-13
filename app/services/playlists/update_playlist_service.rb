# frozen_string_literal: true

module Playlists
  class UpdatePlaylistService < BaseService
    attr_reader :current_user, :id, :playlist_params

    def initialize(current_user, id, playlist_params)
      @current_user = current_user
      @id = id
      @playlist_params = playlist_params
    end

    def call
      playlist = Playlist.find(id)
      authorize playlist, :update?

      OpenStruct.new(success: playlist.update(playlist_params), errors: playlist.errors, playlist: playlist)
    end
  end
end
