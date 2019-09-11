module Api::V1
  class ShortenUrlsController < ApiController
  
    def top_most_url
      @shorten_urls = ShortenerUrl.all.fetch_top_urls
      render json: { shorten_urls: @shorten_urls.as_json }
    end

    def create
      @shorten_url, existing_value = TokenGeneratorService.new(shorten_params[:url]).generate
      if @shorten_url.is_a?(ShortenerUrl)
        url =  request.base_url + '/' + @shorten_url.unique_key
        render json: { status: true, shorten_url:  url, existing_value: existing_value }
      else
        render json: { error: "Please enter valid Url!" }
      end
    end

    def redirect
      if @url.present?
        @url.use_count = @url.use_count + 1
        @url.save
        redirect_to(@url.url)
      else
        render json: { error: "Please invalid Url!" }
      end
    end

    private

    def shorten_params
      params.permit(:url)
    end
  end
end