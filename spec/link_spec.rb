require 'link.rb'

describe '.create' do
  it 'creates a new link' do
    Link.create(url: 'http://www.test.com', title: 'TEST')
    expect(Link.all[3]).to have_attributes(id: '4', url: 'http://www.test.com', title: 'TEST')
  end

  it 'raises an error if the link is invalid' do
    expect(Link.create(url: 'www.test.com', title: 'TEST')).to eq false
  end
end

describe '.delete' do
  it 'should delete a existing title' do
    existing_title = "TEST"
    Link.create(url: 'http://www.test.com', title: 'TEST')
    expect{Link.delete(existing_title)}.to change{Link.all.length}.by(-1)
  end
end
