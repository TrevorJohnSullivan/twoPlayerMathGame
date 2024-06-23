# question.rb

class Question
  attr_reader :number1, :number2, :answer

  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = @number1 + @number2
  end

  def ask(player)
    puts "#{player.name}: what does #{@number1} plus #{@number2} equal?"
  end

  def correct?(input)
    input == @answer
  end
end
