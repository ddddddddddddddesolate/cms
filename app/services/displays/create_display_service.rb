# frozen_string_literal: true

module Displays
  # Create display service
  class CreateDisplayService < BaseService
    attr_reader :event_id, :display_params

    def initialize(current_user, event_id, display_params)
      super(current_user)
      @event_id = event_id
      @display_params = display_params
    end

    def call
      event = Event.find(event_id)
      authorize event, :use?

      authorize_playlist

      display = current_user.displays.new(display_params)
      display.event_id = event_id

      OpenStruct.new(success: display.save, errors: display.errors, display: display)
    end

    private

    def authorize_playlist
      return unless display_params[:playlist_id]

      playlist = Playlist.find(display_params[:playlist_id])
      authorize playlist, :use?
    end
  end
end
