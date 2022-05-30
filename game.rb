require "./input-output"
require "./questions"
require "./player"

class Game

  def initialize
    @io = IO_Helper.new
    @io.output("Welcome to the math game")
    @io.output("Player1: What is your name?")
    @player1name = @io.get_input
    @player1 = Player.new(@player1name)
    @io.output("Player2: What is your name?")
    @player2name = @io.get_input
    @player2 = Player.new(@player2name)
    @players = [@player1, @player2].shuffle
    @question = Question.new
  end

  def game_status
    @io.output ("#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3")
  end

  def game_over?
    if @player1.is_dead? || @player2.is_dead?
      return false
    else
      return true
    end
  end

  def play_game
    while (game_over?) do
      current_player = @players.first
      @io.output("-----NEW TURN -----")
      @io.output("#{current_player.name}: #{@question.ask_question}")
      answer = @io.get_input.to_i
      if @question.ans?(answer)
        @io.output("#{current_player.name}: Yes! You are correct.")
      else
        @io.output("#{current_player.name}: Seriously? No!")
        current_player.lose_life
      end
      game_status
      @players.rotate!
    end
    if @player1.is_dead?
      winner = @player2
    else 
      winner = @player1
    end
    @io.output("-------------------")
    @io.output("#{winner.name} wins with a score of #{winner.lives}/3")
    @io.output("-----GAME OVER-----")
  end

end