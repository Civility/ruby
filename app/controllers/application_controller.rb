class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 #мои методы ошибок
  add_flash_types :success, :danger, :info, :warning
end
