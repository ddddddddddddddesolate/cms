# frozen_string_literal: true

class ContentPolicy < ApplicationPolicy
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
end
