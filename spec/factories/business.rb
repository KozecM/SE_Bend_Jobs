FactoryBot.define do
  factory :business do
    name { "Fake Business Name" }
    job_string { "FAKE WEB DEV:9000:FAKE DESCRIPTION:Not Available" }


    trait :noJobs do
      job_string { '' }
    end

    trait :fullStack do
      job_string { true }
    end

  end
end
