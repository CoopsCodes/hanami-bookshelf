RSpec.feature "Show a book" do
	let(:books) { Hanami.app["relations.books"] }

	context "when the book matches the id" do
		let!(:book_id) do
			books.insert(title: "Dracula", author: "Bram Stoker")
		end

		it "shows the book" do
			visit "/books/#{book_id}"

			expect(page).to have_content "Dracula"
			expect(page).to have_content "Bram Stoker"
		end
	end

	context "when no book matches the id" do
		it "returns an error" do
			visit "/books/#{books.max(:id).to_i + 1}"

			expect(page.status_code).to eq 404
		end
	end
end