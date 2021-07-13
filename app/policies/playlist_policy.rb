# frozen_string_literal: true

class PlaylistPolicy < ApplicationPolicy
  attr_reader :user, :playlist

  def initialize(user, playlist)
    @user = user
    @playlist = playlist
  end

  def update?
    playlist.user == user
  end

  def edit?
    udpate?
  end

  def destroy?
    playlist.user == user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
