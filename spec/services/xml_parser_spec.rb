require 'rails_helper'

RSpec.describe Parsers::XmlParser do
  let(:parser) do
    Parsers::XmlParser.new(
      parser: XML_PARSER,
      url: 'https://www.yourlocalguardian.co.uk/sport/rugby/rss/',
      match: '//pubDate'
    )
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(parser).to respond_to(:keyword_count) }
      it { expect(parser).to respond_to(:cache_key) }
    end

    context 'executes methods correctly' do
      context 'cache_key' do
        it 'returns cache key based on config' do
          parser.stub(:settings).and_return(
            url: 'https://in.reuters.com',
            match: '/a/i'
          )
          expect(parser.cache_key).to eq('https://in.reuters.com - /a/i')
        end
      end

      context 'keyword_count' do
        context 'cache hit' do
          it 'return value from cache' do
            Cache.stub(:get).and_return(10)
            parser.stub(:fallback).and_return(20)
            expect(parser.keyword_count).to eq(10)
          end
        end

        context 'cache miss' do
          it 'returns value from fallback' do
            parser.stub(:fallback).and_return(20)
            expect(parser.keyword_count).to eq(20)
          end
        end
      end
    end
  end
end
