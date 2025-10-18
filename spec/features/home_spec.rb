RSpec.feature "Home" do
	scenario "visiting the home page shows the welcome message" do
		visit "/"

		expect(page).to have_content("Cooper's Bookshelf")
	end
end