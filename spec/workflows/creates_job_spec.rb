require "rails_helper"

RSpec.describe CreatesJob do
    
    describe "initialization" do

        it "creates a job given a title" do
            creator = CreatesJob.new(title: "FAKE JOB TITLE")
            creator.build
            expect(creator.job.title).to eq("FAKE JOB TITLE")
        end
    end
end
