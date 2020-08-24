HTML_PARSER = "Parsers::HtmlParser"
XML_PARSER = "Parsers::XmlParser"

PRICING_POLICY = {
  Flexible: {
    parser: HTML_PARSER,
    url: "https://in.reuters.com",
    match: /a/i,
    rule: {
      operand: "/",
      rhs: 100
    }
  },
  Fixed: {
    parser: HTML_PARSER,
    url: "https://developer.github.com/v3/#http-redirects",
    match: /\bstatus\b/i
  },
  Prestige: {
    parser: XML_PARSER,
    url: "https://www.yourlocalguardian.co.uk/sport/rugby/rss/",
    match: "//pubDate"
  }
}.with_indifferent_access