require_relative '../../lib/app.rb'
feature 'viewing links' do
  scenario 'page displays links' do
    visit '/'
    expect(page).to have_content('google')
    expect(page).to have_content('twitter')
    expect(page).to have_content('facebook')
  end
end

feature 'adding links' do
  scenario 'user is able to add a link' do
    visit '/'
    fill_in('new_link', with: 'http://www.test.com')
    fill_in('new_link_title', with: 'TEST')
    click_button('Add Link')
    expect(page).to have_content('TEST')
  end
  scenario "users can't add invalid link" do
    visit '/'
    fill_in('new_link', with: 'www.test.com')
    fill_in('new_link_title', with: 'TEST')
    click_button('Add Link')
    expect(page).to have_content('Link is invalid')
  end
end
