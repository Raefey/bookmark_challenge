require 'link.rb'

describe '.create' do
  it 'creates a new link' do
    Link.create(url: 'www.test.com')
    expect(Link.all).to include 'www.test.com'
  end
end
