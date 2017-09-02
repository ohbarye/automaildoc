require "pathname"

module Automaildoc
  class Documents
    def initialize
      @mails = []
    end

    def append(context, example)
      mail = Automaildoc::Document.new(context.clone, example.clone)
      (@mails << mail).sort_by(&:subject)
    end

    def write
      write_toc_html
    end

    private

    def write_toc_html
      toc_html_path.parent.mkpath
      toc_html_path.open("w") {|file| file << render_toc_html }
    end

    def render_toc_html
      ERB.new(Automaildoc.configuration.toc_html_template, nil, "-").result(binding)
    end

    def toc_html_path
      Automaildoc.configuration.pathname + "toc.html"
    end
  end
end
