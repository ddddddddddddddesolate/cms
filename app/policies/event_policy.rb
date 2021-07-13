# frozen_string_literal: true

class EventPolicy < ApplicationPolicy
  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def show?
    event.user == user
  end

  def update?
    event.user == user
  end

  def edit?
    update?
  end

  def destroy?
    event.user == user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
