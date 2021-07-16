# frozen_string_literal: true

module Playlists
  # Update playlist service
  class UpdatePlaylistService < BaseService
    attr_reader :id, :playlist_params

    def initialize(current_user, id, playlist_params)
      super(current_user)
      @id = id
      @playlist_params = playlist_params
    end

    def call
      playlist = Playlist.includes(:slides, :contents)
                         .find(id)
      authorize playlist, :update?

      OpenStruct.new(success: playlist.update(playlist_params), errors: playlist.errors, playlist: playlist)
    end
  end
end
