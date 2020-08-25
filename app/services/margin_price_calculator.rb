class MarginPriceCalculator
  attr_reader :settings, :parser, :rule
  def initialize(pricing_policy)
    @settings = PRICING_POLICY[pricing_policy]
    @parser = settings[:parser].constantize.new(settings)
    @rule = settings[:rule]
  end

  def price
    rule ? evaluate_rule : keyword_count
  end

  def keyword_count
    @keyword_count ||= parser.keyword_count
  end

  def evaluate_rule
    keyword_count.send(rule[:operand], rule[:rhs])
  end
end
