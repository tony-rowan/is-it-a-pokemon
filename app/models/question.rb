class Question
  def id
    66
  end

  def body
    Pokemon.available.sample[:name]
  end

  def real
    true
  end
end
