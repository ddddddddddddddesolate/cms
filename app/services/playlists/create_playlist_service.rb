# frozen_string_literal: true

module Playlists
  # Create playlist service
  class CreatePlaylistService < BaseService
    attr_reader :playlist_params

    def initialize(current_user, playlist_params)
      super(current_user)
      @playlist_params = playlist_params
    end

    def call
      playlist = current_user.playlists
                             .includes(:slides, :contents)
                             .new(playlist_params)

      OpenStruct.new(success: playlist.save, errors: playlist.errors, playlist: playlist)
    end
  end
end
