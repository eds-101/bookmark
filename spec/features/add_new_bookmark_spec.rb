feature 'adding a new bookmark' do
  scenario 'it should allow me to add a new bookmark page' do
    visit '/'
    fill_in 'url', with: 'www.bbc.co.uk'
    click_button 'Submit'
    click_link 'View Bookmarks'
    expect(page).to have_content 'www.bbc.co.uk'
  end
  scenario 'it should be a valid URL' do
    visit '/'
    fill_in 'url', with: 'fake bookmark'
    click_button 'Submit'

    expect(page).not_to have_content "fake bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end

