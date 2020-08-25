class Parsers::XmlParser < Parsers::Base
  def keyword_count
    Cache.get(cache_key) { fallback }
  end

  def fallback
    doc = Nokogiri::XML(open(settings[:url]))
    doc.xpath(settings[:match]).count
  end
end