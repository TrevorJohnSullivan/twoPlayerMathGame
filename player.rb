# player.rb

class Player
  attr_reader :name, :lives, :initial_lives

  def initialize(name)
    @name = name
    @lives = 3
    @initial_lives = @lives
  end

  def lose_life
    @lives -= 1
  end

  def alive?
    @lives > 0
  end

  def score
    "#{@lives}/#{@initial_lives}"
  end
end

