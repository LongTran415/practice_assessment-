module Status

  def resolved?
    !!@resolved
  end

  def close
    @resolved = true
  end

  def assigned?
    !!@assigned_employee
  end

end 
