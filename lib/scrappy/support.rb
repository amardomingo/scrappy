require 'open-uri'
require 'net/http'
require 'net/https'

module URI
  def base
    self.to_s.split('/')[0..2] * '/'
  end
end

module Scrappy
  module InputEscaping
    def inputs
      return '' if @input.empty?
      "?" + (@input.map{|k,v| "#{CGI.escape(k)}=#{CGI.escape(v)}"}*'')
    end
  end
end

module Nokogiri
  module XML
    class NodeSet
      def select &block
        NodeSet.new(document, super(&block))
      end
    end
  end
end