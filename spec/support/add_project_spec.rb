require "rails_helper"

RSpec.describe "adding a job listing", type: :system do
    it "allows user to create a job listing with description" do
        visit new_job_path
        fill_in "Title" with: "FAKE JOB TITLE"
        fill_in "Description" with: "FAKE JOB DESCRIPTION"
        Click_on("Post Job")
        visit job_path
        expect(page).to have_content("FAKE JOB TITLE")
    end
end
