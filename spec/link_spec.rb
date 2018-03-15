require 'link.rb'

describe '.create' do
  it 'creates a new link' do
    Link.create(url: 'http://www.test.com')
    expect(Link.all).to include 'http://www.test.com'
  end

  it 'raises an error if the link is invalid' do
    expect(Link.create(url: 'www.test.com')).to eq false
  end
end
