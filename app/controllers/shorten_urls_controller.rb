class ShortenUrlsController <  ApplicationController
  def new 
    @shorten_urls = ShortenerUrl.all.fetch_top_urls
  end

  def redirect
    if @url.present?
      @url.use_count = @url.use_count + 1
      @url.save
      redirect_to(@url.url)
    else
      render :new
    end
  end
end
