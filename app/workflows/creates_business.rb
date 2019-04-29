class CreatesBusiness
    attr_accessor :name, :business, :job_string

    def initialize(name: "", description: "",job_string: "")
        @name = name
        @description = description
        @job_string = job_string
    end

    def success?
        @success
    end

    def build
        self.business = Business.new(name: name)
        business.description = add_business_description
        business.jobs = convert_string_to_job
        business
    end

    def create
        build
        result = business.save
        @success = result
    end

    def convert_string_to_job
        job_string.split("\n").map do |one_job| 
            title, pay_string = one_job.split(":")
            Job.new(title: title, pay: pay_as_integer(pay_string))
        end
    end

    def pay_as_integer(pay_string)
        return 0 if pay_string.blank?
        [pay_string.to_i, 0].max
    end

    def add_business_description
        business.description = @description;
    end
        
end
