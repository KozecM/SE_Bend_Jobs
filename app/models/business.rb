
class Business
    attr_accessor :jobs

    def initialize
        @jobs = []
    end

    def hiring?
        jobs.any?(&:available?)
    end
end