class CreatesJob
  attr_accessor :title, :job, :description_string

  def initialize(title: "", description_string: "", pay: "", availability: availability)
    @title = title
    @description_string = description_string
    @pay = pay
    @availability = availability
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
      title, pay, description, availability = one_description.split(":")
      pay_as_integer(pay)
      Job.new(title: title, pay: pay_as_integer(pay), description: description, available: availability_as_bool(available))
    end
  end

  def pay_as_integer(pay)
    return 1 if pay.blank?
    [pay.to_i, 1].max
  end

  def availability_as_bool(availability)
    return false if availability.blank?
    if availability.lower == "available"
      return true
    end
  end
end
