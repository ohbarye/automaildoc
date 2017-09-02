require "automaildoc/configuration"
require "automaildoc/document"
require "automaildoc/documents"
require "automaildoc/version"
require "automaildoc/rspec" if ENV["AUTOMAILDOC"]

module Automaildoc
  class << self
    def documents
      @documents ||= Documents.new
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
