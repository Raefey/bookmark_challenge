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
    visit '/'
    fill_in('new_link', with: 'http://www.test.com')
    click_button('Add Link')
    expect(page).to have_content('http://www.test.com')
  end
  scenario "users can't add invalid link" do
    visit '/'
    fill_in('new_link', with: 'www.test.com')
    click_button('Add Link')
    expect(page).to have_content('Link is invalid')
  end
end
