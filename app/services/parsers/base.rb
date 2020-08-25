class Parsers::Base
  require 'open-uri'
  attr_reader :settings

  def initialize(settings)
    @settings = settings
    super()
  end

  def fallback
    raise NotImplementedError
  end

  def cache_key
    "#{settings[:url]} - #{settings[:match]}"
  end

  def keyword_count
    Cache.get(cache_key) { fallback }
  end
end
