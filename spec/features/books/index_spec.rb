RSpec.feature "Books" do
	let(:books) { Hanami.app["relations.books"] }

	before do
		books.insert(title: "Let The Right One In", author: "John Ajvide Lindqvist")
		books.insert(title: "The Exorcist", author: "William Peter Blatty")
	end

	it "shows a list of all book" do
		visit "/books"

		expect(page).to have_selector "li", text: "Let The Right One In, by John Ajvide Lindqvist"
		expect(page).to have_selector "li", text: "The Exorcist, by William Peter Blatty"
	end
end