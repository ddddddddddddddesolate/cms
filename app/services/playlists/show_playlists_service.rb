# frozen_string_literal: true

module Playlists
  class ShowPlaylistsService < BaseService
    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end

    def call
      OpenStruct.new(playlists: current_user.playlists)
    end
  end
end
