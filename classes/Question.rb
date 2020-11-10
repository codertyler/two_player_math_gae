class Question

  attr_reader :correct_answer

  def initialize
    @first = rand(1..20)
    @second = rand(1..20)
    @correct_answer = @first + @second
  end

  def display_question
    "What does #{@first} plus #{@second} equal?"
  end

  def correct?(guess)
    guess == @correct_answer
  end

end

