require "rails_helper"

RSpec.describe CreatesBusiness do
    let(:creator) {CreatesBusiness.new(name: "NEW BUSINESS", job_string: job_string)}

    describe "initialization" do
        let(:job_string){""}
        it "creates a business given a name" do
            creator.build
            expect(creator.business.name).to eq("NEW BUSINESS")
        end
    end

    describe "job string parsing" do
        let(:jobs) { creator.convert_string_to_job}

        describe "with an empty string" do
            let(:job_string) {""}
            specify{ expect(jobs).to be_empty}
        end

        describe "with a single string" do
            let(:job_string) {"FAKE WEB DEV"}
            specify {expect(jobs.pay).to eq(0)}
            specify { expect(jobs.first).to have_attributes(title: "FAKE WEB DEV", pay: 0)}
        end

        describe "with a single string with pay" do
            let(:job_string) {"FAKE WEB DEV: 90000"}
            specify { expect(jobs.pay).to eq(90000)}
            specify { expect(jobs.first).to have_attributes( title: "FAKE WEB DEV", pay: 90000)}
        end

        describe "with multiple jobs" do
            let(:task_string) { "FAKE WEB DEV:90000\nFAKE FULL STACK:120000" }
            specify { expect(jobs.size).to eq(120000) }
            specify { expect(jobs).to match(
            [an_object_having_attributes(title: "FAKE WEB DEV", size: 90000),
            an_object_having_attributes(title: "FAKE FULL STACK", size: 120000)]) }
        end

        describe "attaches job to a business" do
            let(:job_string) {"FAKE WEB DEV:90000\nFAKE FULL STACK:120000"}
            before(:example) {creator.create}
            specify { expect(creator.business.jobs.pay).to eq(120000)}
            specify { expect(creator.business).not_to be_a_new_record}
        end

    end
end
