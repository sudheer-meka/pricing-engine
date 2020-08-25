class Parsers::Base 
  require 'open-uri'
  attr_reader :settings
  
  def initialize(settings)
    @settings = settings
    super()
  end

  def keyword_count
    raise NotImplementedError
  end

  def cache_key
    "#{settings[:url]} - #{settings[:match]}"
  end
end