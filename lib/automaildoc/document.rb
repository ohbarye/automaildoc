require 'erb'

module Automaildoc
  class Document
    def initialize(context, example)
      @context = context
      @example = example
    end

    def render
      ERB.new(Automaildoc.configuration.html_template, nil, '-').result(binding)
    end

    def id
      @example.id
    end

    def description
      @example.full_description
    end

    def mail
      @context.mail
    end

    def to
      mail.to || []
    end

    def cc
      mail.cc || []
    end

    def bcc
      mail.bcc || []
    end

    def subject
      mail.subject || ''
    end

    def body
      mail.body || ''
    end
  end
end
