# frozen_string_literal: true

module Playlists
  class ShowPlaylistService < BaseService
    attr_reader :current_user, :id

    def initialize(current_user, id)
      @current_user = current_user
      @id = id
    end

    def call
      playlist = Playlist.find(id)
      authorize playlist, :show?

      OpenStruct.new(playlist: playlist)
    end
  end
end
