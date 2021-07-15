# frozen_string_literal: true

# Event policy
class EventPolicy < ApplicationPolicy
  def use?
    record.user_id == user.id
  end

  def show?
    record.user_id == user.id
  end

  def update?
    record.user_id == user.id
  end

  def destroy?
    record.user_id == user.id
  end

  # Event scope
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.includes(displays: [playlist: %i[slides contents]])
           .where(user_id: user.id)
    end
  end
end
