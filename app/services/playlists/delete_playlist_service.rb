# frozen_string_literal: true

module Playlists
  class DeletePlaylistService < BaseService
    attr_reader :current_user, :playlist_params

    def initialize(current_user, playlist_params)
      @current_user = current_user
      @playlist_params = playlist_params
    end

    def call
      playlist = current_user.playlists.find_by!(playlist_params)

      playlist.destroy

      OpenStruct.new(success: playlist.destroyed?, errors: playlist.errors, playlist: playlist)
    end
  end
end
