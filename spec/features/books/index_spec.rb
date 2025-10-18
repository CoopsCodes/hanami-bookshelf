RSpec.feature "Books" do
	let(:books) { Hanami.app["relations.books"] }

	before do
		books.insert(title: "Let The Right One In", author: "John Ajvide Lindqvist")
		books.insert(title: "The Exorcist", author: "William Peter Blatty")
		books.insert(title: "The Shining", author: "Stephen King")
		books.insert(title: "Dracula", author: "Bram Stoker")
		books.insert(title: "Frankenstein", author: "Mary Shelley")
		books.insert(title: "The Haunting of Hill House", author: "Shirley Jackson")
	end

	it "shows a list of all book" do
		visit "/books"

		expect(page).to have_selector "li", text: "Let The Right One In, by John Ajvide Lindqvist"
		expect(page).to have_selector "li", text: "The Exorcist, by William Peter Blatty"
	end

	it "should show a paginated button" do
		visit "/books"

		expect(page).to have_selector "a", text: "More >"
		expect(page).not_to have_selector "a", text: "< Previous"
	end

	it "should navigate to the next page" do
		visit "/books"

		expect(page).to have_selector "a", text: "More >"
		click_link "More >"

		expect(page).to have_selector "li", text: "The Shining, by Stephen King"

		expect(current_path).to eq "/books"
		expect(page).to have_current_path("/books?page=2&per_page=5")
	end
end