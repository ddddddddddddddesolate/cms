# frozen_string_literal: true

module Playlists
  class CreatePlaylistService < BaseService
    attr_reader :current_user, :playlist_params

    def initialize(current_user, playlist_params)
      @current_user = current_user
      @playlist_params = playlist_params
    end

    def call
      playlist = current_user.playlists.new(playlist_params)

      OpenStruct.new(success: playlist.save, errors: playlist.errors, playlist: playlist)
    end
  end
end
