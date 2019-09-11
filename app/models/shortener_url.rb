class ShortenerUrl < ApplicationRecord
  validates :url, format: URI::regexp(%w[http https])
  scope :fetch_top_urls, -> { order(use_count: :desc).limit(100) }
end
