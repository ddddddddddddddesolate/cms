# frozen_string_literal: true

module Displays
  # Update display service
  class UpdateDisplayService < BaseService
    attr_reader :event_id, :id, :display_params

    def initialize(current_user, event_id, id, display_params)
      super(current_user)
      @event_id = event_id
      @id = id
      @display_params = display_params
    end

    def call
      event = Event.find(event_id)
      authorize event, :use?

      authorize_playlist

      display = Display.find(id)

      OpenStruct.new(success: display.update(display_params), errors: display.errors, display: display)
    end

    private

    def authorize_playlist
      return unless display_params[:playlist_id].present?

      playlist = Playlist.find(display_params[:playlist_id])
      authorize playlist, :use?
    end
  end
end
