class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def generate_flash(resource)
    resource.errors.messages.each do |validation, message|
      flash[validation] = "#{validation}: #{message}"
    end
  end
end
