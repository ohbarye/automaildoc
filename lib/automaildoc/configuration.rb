module Automaildoc
  class Configuration
    class << self
      def property(name, &default)
        define_method(name) do
          if instance_variable_defined?("@#{name}")
            instance_variable_get("@#{name}")
          else
            instance_variable_set("@#{name}", instance_exec(&default))
          end
        end

        attr_writer name
      end
    end

    property :path do
      "doc/mails"
    end

    property :html_template do
      File.read(File.expand_path("../templates/mail.html.erb", __FILE__))
    end

    property :toc_html_template do
      File.read(File.expand_path("../templates/toc.html.erb", __FILE__))
    end

    def pathname
      Pathname.new(path)
    end
  end
end