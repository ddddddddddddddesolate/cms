# frozen_string_literal: true

module Playlists
  class UpdatePlaylistService < BaseService
    attr_reader :current_user, :playlist_params

    def initialize(current_user, playlist_params)
      @current_user = current_user
      @playlist_params = playlist_params
    end

    def call
      playlist = current_user.playlists.find_by!(playlist_params.extract!(:id))

      OpenStruct.new(success: playlist.update(playlist_params), errors: playlist.errors, playlist: playlist)
    end
  end
end
