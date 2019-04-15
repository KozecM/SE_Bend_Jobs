class Job

  def initialize
    @available = false
  end

  def mark_as_available
    @available = true
  end

  def available?
    @available
  end

end