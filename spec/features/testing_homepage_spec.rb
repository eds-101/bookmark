feature 'homepage test' do
  scenario 'it should open the page with hello world' do
    visit '/'
    fill_in "title", with: "www.bbc.co.uk"

    expect(page).to have_content "View Bookmarks"
  end

end
