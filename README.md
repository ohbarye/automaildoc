# Automaildoc

[![Gem Version](https://badge.fury.io/rb/automaildoc.svg)](https://badge.fury.io/rb/automaildoc)
[![Build Status](https://travis-ci.org/ohbarye/automaildoc.svg?branch=master)](https://travis-ci.org/ohbarye/automaildoc)

Automaildoc is a gem to generate a list of about mails from your mail spec.

![image](https://user-images.githubusercontent.com/1811616/30522089-771f2474-9c05-11e7-8f9f-ed8f828c18b8.png)

This gem, idea, design all are completely inspired by the awesome predecessor, https://github.com/r7kamura/autodoc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'automaildoc', group: :test
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install automaildoc
```

## Usage

1. Add a `automaildoc` tag to your mail spec.

```ruby
RSpec.describe 'Sign up mail', automaildoc: true do
  let!(:user) { create(:user) }
  let!(:mail) { SignupMailer.mail(user) }

  it 'should send to a user' do
    expect(mail.to).to eq user
  end
end
```

2. Run rspec test with `AUTOMAILDOC`

```console
$ AUTOMAILDOC=1 bundle exec rspec
```

That's it. Then Automaildoc generates an HTML file to `./doc/mails`. The file should be what you've wanted.

![automaildoc](https://user-images.githubusercontent.com/1811616/29994112-c6dacbc6-9002-11e7-812f-a346d415d6c4.gif)

### Example

You can see `spec/dummy/doc/toc.html` in this repository, which is auto-generated one from mail specs in `spec/mails`.

### Custom description

You can write descriptions with let(:description).

```ruby
describe 'Sign up mail', automaildoc: true do
  let(:description) { 'Sign up mail for newly signed up user' }

  # examples follow
end
```

### Configuration

- path - [String] location to put files (default: `./doc/mails`)
- html_template - [String] ERB template for a mail (default: `./automaildoc/templates/mail.html.erb`)
- toc_html_template - [String] ERB template for table of content (default: `./automaildoc/templates/toc.html.erb`)

```ruby
Automaildoc.configuration.path = "doc/mails"
Automaildoc.configuration.html_template = File.read(File.expand_path("../automaildoc/templates/mail.html.erb", __FILE__))
Automaildoc.configuration.toc_html_template = File.read(File.expand_path("../automaildoc/templates/toc.html.erb", __FILE__))
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ohbarye/automaildoc. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
