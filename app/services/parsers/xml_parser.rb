class Parsers::XmlParser < Parsers::Base
  def fallback
    doc = Nokogiri::XML(open(settings[:url]))
    doc.xpath(settings[:match]).count
  end
end
