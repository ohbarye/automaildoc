require "rspec"

RSpec.configuration.after(:each, automaildoc: true) do |example|
  Automaildoc.documents.append(self, example) unless example.pending?
end

RSpec.configuration.after(:suite) do
  Automaildoc.documents.write
end
