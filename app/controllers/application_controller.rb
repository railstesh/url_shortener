class ApplicationController < ActionController::Base
  before_action :check_urls

  def check_urls 
    path = request.path
    if path.present?
      @url = ShortenerUrl.find_by(unique_key: request.path.split('/').last)
    end
  end
end
