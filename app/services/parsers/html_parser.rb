class Parsers::HtmlParser < Parsers::Base 
  def fallback
    clean_content.scan(settings[:match]).count
  end

  def clean_content
    parser = Nokogiri::HTML(open(settings[:url]), nil, Encoding::UTF_8.to_s)
    parser.xpath('//script')&.remove
    parser.xpath('//style')&.remove
    parser.xpath('//text()').map(&:text).join(' ').squish
  end
end