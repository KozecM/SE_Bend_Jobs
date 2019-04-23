class CreatesBusiness
    attr_accessor :name, :business

    def initialize(name: "")
        @name = name
    end

    def build
        self.business = Business.new(name: name)
        business
    end
end
