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
end