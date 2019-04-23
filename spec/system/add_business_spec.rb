require "rails_helper"

RSpec.describe "adding a business", type: :system do
    it "allows user to create a business with open jobs" do
        visit new_business_path
        fill_in "Name", with: "FAKE BUSINESS NAME"
        fill_in "Jobs", with: "FAKE JOB\n"
        click_on("Create Business")
        visit business_path
        expect(page).to have_content("FAKE BUSINESS NAME")
    end
end
