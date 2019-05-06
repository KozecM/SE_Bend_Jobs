require "rails_helper"
require "business.rb"

RSpec.describe Business do
  let(:business) { Business.new(name: "FAKE BUSINESS") }
  let(:job) { Job.new }
  let(:job2) { Job.new(title: "FAKE JOB WITH SALARY", pay: 92000, description: "FAKE DESCRIPTION", available: true) }
  let(:creator) {CreatesBusiness.new(name: "TEST BUSINESS", job_string: "FAKE WEB DEV:9000:FAKE DESCRIPTION:Available")}

  it "considers a business with no jobs to be not hiring" do
    expect(business).not_to be_hiring
  end

  it "knows that a business with no jobs is not hiring" do
    business.jobs << job
    expect(business).not_to be_hiring
  end

  it "marks a business as hiring if the jobs are available" do
    business.jobs << job
    job.mark_as_available
    expect(business).to be_hiring
  end

  describe "open job salary tracking" do
    

    it "returns 0 if there are no open jobs" do
      expect(business.open_job_salaries).to eq(0)
    end

    
  end
end
