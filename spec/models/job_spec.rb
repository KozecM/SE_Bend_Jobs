require "rails_helper"

RSpec.describe Job do
  let(:job) { Job.new }

  it "does not have new job as available" do
    expect(job).not_to be_available
  end

  it "allows us to list a job as available" do
    job.mark_as_available
    expect(job).to be_available
  end
  
  it "can add a Job description" do
    expect(job.add_job_description("fake description")).to be_truthy
  end

  it "can add a pay rate" do
    expect(job.add_job_pay_rate(1234)).to be_truthy
  end
end
