class Business < ApplicationRecord
    has_many :jobs, dependent: :destroy
    validates :name, presence: true

    def hiring?
        jobs.any?(&:available?)
    end

    def available_jobs
        jobs.available?
    end
end
