class Job < ApplicationRecord
  belongs_to :business

  def mark_as_available
    @available = true
  end

  def available?
    @available
  end

  def add_job_description(jobDescription)
   
    @description = jobDescription

    return @description
  end

  def add_job_pay_rate(pay)
    @payRate = pay

    return @payRate
  end
end
