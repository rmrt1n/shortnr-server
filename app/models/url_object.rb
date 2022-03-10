require 'uri'

class UrlObject < ApplicationRecord
  CHARSET = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze

  validates :long_url, presence: true, on: :create
  # validates :long_url, format: URI::regexp
  validates_uniqueness_of :slug
  before_create :shorten_url

  def shorten_url
    key = base62(rand(62**7 - 1))
    if UrlObject.where(slug: key).last.present?
      self.shorten_url
    else
      self.slug = key
    end
  end

  def base62(n)
    return '0' if n <= 0
    str = ''
    while n > 0
      str = CHARSET[n % 62] << str
      n /= 62
    end
    str
  end

end
