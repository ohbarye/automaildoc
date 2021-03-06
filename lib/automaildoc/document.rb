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
      if @context.respond_to?(:description)
        @context.description.strip
      else
        @example.full_description
      end
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

    def multipart?
      mail.multipart?
    end

    def text_part
      mail.text_part
    end

    def html_part
      mail.html_part
    end
  end
end
