class Question

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @question = "What is #{@num1} + #{@num2}"
    @answer = @num1 + @num2
  end

  def correct?(answer)
    answer.to_i == @answer
  end

end