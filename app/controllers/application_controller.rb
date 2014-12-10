class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_series

  def current_series
    Series.last
  end
end
