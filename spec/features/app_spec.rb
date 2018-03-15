require_relative '../../lib/app.rb'
feature 'viewing links' do
  scenario 'page displays links' do
    visit '/'
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.twitter.com')
    expect(page).to have_content('http://www.facebook.com')
  end
end

feature 'adding links' do
  scenario 'user is able to add a link' do
    visit '/add'
    fill_in('url', with: 'http://www.test.com')
    click_button('Submit')
    expect(page).to have_content('http://www.test.com')
  end
  scenario "users can't add invalid link" do
    visit '/add'
    fill_in('url', with: 'www.test.com')
    click_button('Submit')
    expect(page).to have_content('Link is invalid')
  end
end
