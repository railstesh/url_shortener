require 'open-uri'

class TokenGeneratorService
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def generate
    begin
      existing_url = check_existing?
      if existing_url.blank?
        token = SecureRandom.hex(3)
        title = Nokogiri::HTML.parse(open(url)).title
        shorten_obj = ShortenerUrl.create(url: url, unique_key: token, title: title)
      else
        shorten_obj = existing_url
      end
    rescue Exception => e
    end
    [shorten_obj, existing_url.present?]
  end

  def check_existing?
    ShortenerUrl.find_by(url: url)
  end
end