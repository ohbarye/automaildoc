require "spec_helper"
require "mail"

RSpec.describe 'Sign up mail', automaildoc: true do
  let(:description) { 'Sign up mail for newly signed up user' }
  let!(:mail) {
    Mail.new do
      from    'awesome-startup@example.com'
      to      'early-adoptor@example.com'
      bcc     ['customer-support@example.com', 'data-analysis@example.com']
      subject 'Welcome to our awesome new service!'

      text_part do
        body <<~EOS
          Hello Johns Lee!

          You’ve recently signed up to our Awesome Product,
          and we hope that you’ve noticed that there is much more to it than boring one.

          Let’s see what else you can do on our product.

          ----------------------------------------------------

          Awesome Startup
          https://awesome.example.com/
        EOS
      end

      html_part do
        content_type 'text/html; charset=UTF-8'
        body <<~EOS
          <h1>Hello Johns Lee!</h1>

          You’ve recently signed up to our <b>Awesome Product</b>,<br/>and we hope that you’ve noticed that there is much more to it than boring one.

          Let’s see what else you can do on our product.

          ----------------------------------------------------

          Awesome Startup
          https://awesome.example.com/
        EOS
      end
    end
  }

  it 'should sent to user with text/html parts' do
    expect(mail.from).to match_array ['awesome-startup@example.com']
    expect(mail.to).to match_array ['early-adoptor@example.com']
    expect(mail.subject).to eq('Welcome to our awesome new service!')
    expect(mail.text_part.body.to_s).to include 'Johns Lee'
    expect(mail.html_part.body.to_s).to include 'Johns Lee'
  end
end
