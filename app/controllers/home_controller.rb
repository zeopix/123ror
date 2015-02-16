class HomeController < ApplicationController
  def index
    I18n.locale = session[:locale] = params[:locale] || I18n.default_locale
  end
end
