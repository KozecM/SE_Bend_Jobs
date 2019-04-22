require "rails_helper"

RSpec.describe CreatesJob do
    
    describe "initialization" do

        it "creates a job given a title" do
            creator = CreatesJob.new(title: "FAKE JOB TITLE")
            creator.build
            expect(creator.job.title).to eq("FAKE JOB TITLE")
        end
    end

    describe "description string parsing" do
        it "handles an empty string" do
            creator = CreatesJob.new(title: "FAKE JOB TITLE", description_string:"")
            description = creator.convert_string_to_description
            expect(description).to be_empty
        end

        it "handles a single string" do
            creator = CreatesJob.new(title: "FAKE JOB TITLE", description_string: "FAKE JOB DESCRIPTION")
            description = creator.convert_string_to_description
            expect(description.size).to eq(1)
            expect(description.first).to have_attributes(title: "FAKE JOB DESCRIPTION", size: 1)
        end
    end
end
