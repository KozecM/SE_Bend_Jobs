class Job < ApplicationRecord
  belongs_to :business, optional: true

  def mark_as_available
    self.available = true
  end

  def add_job_title(jobTitle)
    @title = jobTitle

    return @title
  end

  def add_job_description(jobDescription)
    @description = jobDescription

    return @description
  end

  def validates_pay_value
  end

  def job_pay
    return @pay
  end

  def add_job_pay_rate(payRate)
    @pay = payRate

    return @pay
  end

  def preform(big_dependency.execute)
    big_dependency.execute
    return 42
  end
end
