# frozen_string_literal: true

class ContentPolicy < ApplicationPolicy
  attr_reader :user, :content

  def initialize(user, content)
    @user = user
    @content = content
  end

  def show?
    content.user == user
  end

  def update?
    content.user == user
  end

  def edit?
    udpate?
  end

  def destroy?
    content.user == user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
