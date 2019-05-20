require "rails_helper"

RSpec.describe Job, type: :model do
  let(:new_job) { FactoryBot.build_stubbed(:job, :new_available) }
  let(:old_job) { FactoryBot.build_stubbed(:job, :old_available) }
  let(:no_pay) { FactoryBot.build_stubbed(:job, :nopay) }

  it "creates a job with a title and description" do
    job = FactoryBot.create(:job)
    expect(job.title).to eq("Fake Title")
    expect(job.description).to eq("Fake Description")
  end

  it "Has a new job with availability" do
    expect(new_job.available).to be_truthy
    expect(new_job.created_at.ctime).to eq(1.day.ago.ctime)
  end

  it "Has an old job with availability" do
    expect(old_job.available).to be_truthy
    expect(old_job.created_at.ctime).to eq(6.months.ago.ctime)
  end

  # it "Doesn't accept a job with no pay" do
  #   refute(no_pay)
  # end

  # it "runs a big dependency" do
  #   job = FactoryBot.create(:job)
  #   result = job.preform(BigDependency.new)
  #   expect(result).to eq(42)
  # end
  it "stubs an bigdependency object" do
    bigdependency = BigDependency.new
    allow(bigdependency).to receive(:execute).and_return(42)
    job = FactoryBot.create(:job)
    expect(job.preform(bigdependency)).to eq(42)
  end
  it "mocks a dependency" do
    job = FactoryBot.create(:job)
    mock_dependency = BigDependency.new
    expect(mock_dependency).to receive(:execute).and_return(42)
    result = job.preform(mock_dependency)
    expect(result).to eq(42)
  end

  #I tried stubbing the class both the BigDependency and the Job. but neither worked.
  it "stubs the class" do
    allow(BigDependency).to receive(:execute).and_return(BigDependency.new())
    job = FactoryBot.create(:job)
    result = job.preform(BigDependency.execute(1))
    expect(result).to eq(42)
  end
end
