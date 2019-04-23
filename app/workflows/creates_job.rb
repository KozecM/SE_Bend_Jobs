class CreatesJob
    attr_accessor :title, :job, :description_string

    def initialize(title: "", description_string: "")
        @title = title
        @description_string = description_string
    end

    def build
        self.job = Job.new(title: title)
        job.description = convert_string_to_description
        job
    end

    def create
        build
        job.save
    end

    def convert_string_to_description
        description_string.split("\n").map do |one_description|
            title, size_string = one_description.split(":")
            Job.new(title: title)
        end
    end

    def size_as_integer(size_string)
        return 1 if size_string.blank?
        [size_string.to_i, 1].max
    end

    
end
