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

  def job_pay
    return @pay
  end

  def add_job_pay_rate(payRate)
    @pay = payRate

    return @pay
  end

  def add_job_id(id)
    @id = id
  end
end
