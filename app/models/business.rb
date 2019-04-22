
class Business < ApplicationRecord
    has_many :jobs, dependent: :destroy

    def hiring?
        jobs.any?(&:available?)
    end
end
