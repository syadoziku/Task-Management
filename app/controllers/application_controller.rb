class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
end


class UserController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :edit, :update]
  before_action :limitation_login_user, only: [:new, :create, :login_page, :login]
end