RSpec.feature "Creating books" do
	it "it creates a new book when the correct attributes are provided" do
		visit "/books/new"

		fill_in "Title", with: "Frankenstein"
		fill_in "Author", with: "Mary Shelley"
		click_button "Create"

		expect(page).to have_content "Book created"
		expect(page).to have_selector "h1", text: "Frankenstein"
		expect(page).to have_selector "p", text: "By Mary Shelley"
	end

	it "it displays an error when book creation fails due to missing attributes" do
		visit "/books/new"

		fill_in "Title", with: "Frankenstein"
		fill_in "Author", with: ""
		click_button "Create"

		expect(page).to have_content "Book could not be created"
		expect(page).to have_field "Title", with: "Frankenstein"
		expect(page).to have_field "Author", with: ""
	end
end