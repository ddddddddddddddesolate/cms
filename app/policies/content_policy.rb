# frozen_string_literal: true

# Content policy
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
