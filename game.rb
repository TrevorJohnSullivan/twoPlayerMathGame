# game.rb
require_relative 'player'
require_relative 'question'

class Game
  def initialize(player1_name, player2_name)
    @players = [Player.new(player1_name), Player.new(player2_name)]
    @current_player_index = 0
  end

  def play
    until game_over?
      current_player = @players[@current_player_index]
      question = Question.new

      question.ask(current_player)
      print "> "
      answer = gets.chomp.to_i

      if question.correct?(answer)
        puts "YES! you got it right!"
      else
        puts "Wrong answer loser!"
        current_player.lose_life
      end

      show_scores
      switch_players unless game_over?
      puts "---- NEW TURN ----" unless game_over?
    end

    announce_winner
  end

  private

  def switch_players
    @current_player_index = (@current_player_index + 1) % 2
  end

  def game_over?
    !@players[0].alive? || !@players[1].alive?
  end

  def show_scores
    puts "P1: #{@players[0].score} vs P2: #{@players[1].score}"
  end

  def announce_winner
    winner = @players.find(&:alive?)
    puts "... No new turns - There is a winner ..."
    puts "#{winner.name} wins with a score of #{winner.score}"
    puts "---- GAME OVER ----"
  end
end
