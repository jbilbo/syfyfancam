# frozen_string_literal: true

require 'nokogiri'
require 'uri'
require 'net/http'

module Syfyfancam
  class URL
    attr_reader :uri

    def initialize(url)
      @uri = URI.parse(url)
      raise ArgumentError, ERROR_URL unless personal_hash?
    rescue URI::InvalidURIError => e
      raise e, ERROR_URL
    end

    def images
      build_urls.map { |url| URI.parse(url).to_s }
    end

    def personal_hash
      uri.to_s.split('/').last
    end

    private

    def personal_hash?
      personal_hash && personal_hash.size == 12
    end

    def build_urls
      (1..100).map { |i| "#{base_url}#{format('%<filenumber>03d', filenumber: i)}.jpg" }
    end

    def base_url
      @base_url ||= Nokogiri::HTML(Net::HTTP.get(uri)).at('meta[property="og:image"]')['content'][0..-8]
    end
  end
end
