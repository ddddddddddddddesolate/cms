# frozen_string_literal: true

# Controller, that provides authentication
class AuthenticatedController < ApplicationController
  before_action :authenticate_user!
end
