require "./question"
require "./player"

class Game

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = player1
  end

  def switch_player
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end

  def start_game
    puts "----- MATH GAME -----"
    while true
      question = Question.new
      puts "#{current_player.name}: #{question.question}"
      user_answer = gets.chomp
      if question.correct?(user_answer)
        puts "#{current_player.name}: YES! You are correct!"
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.decrease_life
      end

      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"

      if current_player.lives.zero?
        announce_winner(current_player)
        break
      end

      puts "----- NEW TURN -----"
      switch_player
    end
  end

  def announce_winner(winner)
    other_player = @players.find { |player| player != winner }
    puts "#{other_player.name} wins with a score of #{other_player.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  private

  def current_player
    @current_player
  end
end