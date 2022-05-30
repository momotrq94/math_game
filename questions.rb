require 'humanize'

class Question
  @num1
  @num2

  def ask_question
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    question = "What does #{@num1.humanize} plus #{@num2.humanize} equal?"
  end

  def sum
    @num1+@num2
  end

  def ans?(user_answer)
    if user_answer == @num1+@num2
      return true
    else
      return false
    end
  end

end
