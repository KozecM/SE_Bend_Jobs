class Job < ApplicationRecord
  belongs_to :business

  def mark_as_available
    @available = true
  end

  def available?
    @available
  end

  def add_job_title(jobTitle)
    @title = jobTitle

    return @title
  end

  def job_title
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
end
