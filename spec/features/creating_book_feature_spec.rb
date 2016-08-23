require 'rails_helper'

RSpec.feature "creating Books" do
  let!(:peachpit) { Fabricate(:publisher, name: "Peachpit Press") }
  let!(:author1) { Fabricate(:author) }
  let!(:author2) { Fabricate(:author) }

  scenario "with valid inputs succeeds" do
    visit root_path

    click_link "Books", exact: true
    click_link "Add new book"

    fill_in "Title", with: "Javascript"
    fill_in "Isbn", with: "9876321772978"
    fill_in 'Page count', with: 518
    fill_in 'Price', with: 29.99
    fill_in 'Description', with: 'learn JS the easy way'
    fill_in 'Published at', with: '2014-01-01'
    select 'Peachpit Press', from: 'Publisher'
    attach_file 'Book cover', 'app/assets/images/itext.jpg'
    check author1.full_name
    check author2.full_name

    click_button 'Create Book'

    expect(page).to have_content('Book has been created.')
    expect(page).to have_content("can't be blank")
  end
end
