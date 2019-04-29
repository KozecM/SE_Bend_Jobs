require "rails_helper"

RSpec.describe CreatesBusiness do
    let(:creator) {CreatesBusiness.new(name: "TEST BUSINESS", description: description, job_string: job_string)}

    describe "initialization" do
        let(:job_string){""}
        let(:description){""}
        it "creates a business given a name" do
            creator.build
            expect(creator.business.name).to eq("TEST BUSINESS")
        end
    end

    describe "add info about business" do

        describe "with an empty description" do
            let(:description){""}
            specify{expect(creator.business.description).to eq("")}
        end
    end

    describe "job string parsing" do
        let(:jobs) { creator.convert_string_to_job }

        describe "with an empty string" do
            let(:job_string) {""}
            specify{ expect(jobs).to be_empty}
        end

        describe "with a single string" do
            let(:job_string) {"FAKE WEB DEV"}
            before(:example) {creator.create}
            specify {expect(jobs.size).to eq(1)}
            specify { expect(jobs.first).to have_attributes(title: "FAKE WEB DEV", pay: 0)}
        end

        describe "with a single string with pay" do
            let(:job_string) {"FAKE WEB DEV: 90000"}
            specify { expect(jobs.size).to eq(1)}
            specify { expect(jobs.first).to have_attributes( title: "FAKE WEB DEV", pay: 90000)}
        end

        describe "with multiple jobs" do
            let(:job_string) { "FAKE WEB DEV:90000\nFAKE FULL STACK:120000" }
            specify { expect(jobs.size).to eq(2) }
            specify { expect(jobs).to match(
            [an_object_having_attributes(title: "FAKE WEB DEV", pay: 90000),
            an_object_having_attributes(title: "FAKE FULL STACK", pay: 120000)]) }
        end

        describe "attaches job to a business" do
            let(:job_string) {"FAKE WEB DEV:90000\nFAKE FULL STACK:120000"}
            before(:example) {creator.create}
            specify { expect(creator.business.jobs.size).to eq(2)}
            specify { expect(creator.business).not_to be_a_new_record}
        end

    end

    describe "failure cases" do
        it "fails when trying to save business with no name" do
            creator = CreatesBusiness.new(name: "", job_string: "")
            creator.create
            expect(creator).not_to be_a_success
        end

        it "fails when trying to post a job without a Title" do
            creator = CreatesBusiness.new(name: "FAKE Business", job_string:":90000" )
            creator.create
            expect(creator).not_to be_a_success
        end
    end
end
