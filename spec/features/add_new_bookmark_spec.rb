feature 'adding a new bookmark' do
  scenario 'it should allow me to add a new bookmark page' do
    visit '/'
    fill_in 'url', with: 'www.bbc.co.uk'
    click_button 'Submit'
    click_link 'View Bookmarks'
    expect(page).to have_content 'www.bbc.co.uk'
  end
end