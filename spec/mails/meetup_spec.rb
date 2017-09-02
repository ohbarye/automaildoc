require "spec_helper"
require "mail"

RSpec.describe 'Meetup mail', automaildoc: true do
  let!(:mail) {
    Mail.new do
      from    'awesome-startup@example.com'
      to      'veteran@example.com'
      subject 'How about pair programming session?'
      body    <<~EOS
        Hey, Chris!

        As you know, we keep the meetups on a regular monthly basis: the first Monday of the month, at 7:30pm.

        Due to the vacation constraints of this season, the August session will be held on the 14th (i.e. the 2nd Monday).

        Apart from that, same place, same time. 🎉 

        ----------------------------------------------------

        Awesome Startup
        https://awesome.example.com/
      EOS
    end
  }

  it 'should sent to user' do
    expect(mail.from).to match_array ['awesome-startup@example.com']
    expect(mail.to).to match_array ['veteran@example.com']
    expect(mail.subject).to eq('How about pair programming session?')
    expect(mail.body.to_s).to include 'Chris'
  end
end
