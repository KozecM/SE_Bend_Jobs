require "rails_helper"
require "business.rb"

RSpec.describe Business do
  let(:business) { Business.new }
  let(:job) { Job.new }

  it "considers a business with no jobs to be not hiring" do
    expect(business).not_to be_hiring
  end

  it "knows that a business with no jobs is not hiring" do
    business.jobs << job
    expect(business).not_to be_hiring
  end

  it "marks a business done if the jobs are available" do
    business.jobs << job
    job.mark_as_available
    expect(business).to be_hiring
  end

end