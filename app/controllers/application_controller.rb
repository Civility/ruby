class ApplicationController < ActionController::Base
# токен безопасности создается автоматически  заменил на prepend: true
# будет всегда вызываться первым в цепочке колбэков
  protect_from_forgery prepend: true
  #мои методы ошибок
  add_flash_types :success, :danger, :info, :warning
end
