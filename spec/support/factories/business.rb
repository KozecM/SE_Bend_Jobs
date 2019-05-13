FactoryBot.define do
    factory :business do
        name {"TEST BUSINESS"}
        jobs {[]}

        trait :withJobs do
            jobs {}
    end
end
