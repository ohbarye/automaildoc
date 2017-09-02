require "spec_helper"

RSpec.describe Automaildoc::Documents do
  describe "#render_toc_html" do
    before do
      documents.append(context, example)
    end

    let(:documents) do
      Automaildoc::Documents.new
    end

    let(:context) do
      mock = double(example: example, mail: mail, file_path: file_path, full_description: full_description)
      allow(mock).to receive_messages(clone: mock)
      mock
    end

    let(:example) do
      mock = double(id: 1, file_path: file_path, full_description: full_description)
      allow(mock).to receive_messages(clone: mock)
      mock
    end

    let(:mail) {
      require 'mail'
      Mail.new do
        from    'awesome-startup@example.com'
        to      'early-adoptor@example.com'
        subject 'Welcome to our awesome new service!'
        body    <<~EOS
        Hello John!

        You’ve recently signed up to our Awesome Product, and we hope that you’ve
        noticed that there is much more to it than boring one.
        Let’s see what else you can do on our product.

        ----------------------------------------------------

        Awesome Startup
        https://awesome.example.com/
        EOS
      end
    }

    context "with GET /recipes spec" do
      let(:full_description) { "Sign up mail should sent to user" }
      let(:file_path) { "spec/mails/signup_spec.rb" }

      subject { toc_html = documents.send(:render_toc_html) }

      it "includes links to sign up mail" do
        expect(subject).to include('href="#1"')
      end

      it "includes mail info" do
        expect(subject).to include(mail.subject)
      end
    end
  end
end
