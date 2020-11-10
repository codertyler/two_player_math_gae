class Game

  attr_reader     :which_round, :active_player

  def initialize
    @active_player = nil
    @players = []
    @which_round = 0
  end

  # starts the game and switch between (loop) the players
  def run_game

    #creating the players

    player1 = Player.new("Player 1")
    player2 = Player.new("Player 2")
    @players << player1
    @players << player2

    @active_player = @players[1]

    while (@active_player.life > 0)
        run_round
    end

    game_over

  end

  # switching between players
  def switch_player!
    if (@active_player == @players[0])
      @active_player = @players[1]
    else
      @active_player = @players[0]
    end

  end

  #ends the game when one player reaches 0
  def game_over
    switch_player!
    puts "#{@active_player.name} wins with #{@active_player.life}/3"
    puts "\n\n________ GAME OVER ________"
    puts "\n\n Good bye!"
  end

  # Runs through a standard round for the active player
  def run_round
        switch_player!
        question = Question.new
        puts "----- NEW TURN -----"
        puts "#{@active_player.name} : #{question.display_question} "
        answer = gets.chomp.to_i

        if question.correct?(answer)
          puts "#{@active_player.name} : YES! You are correct."
          puts "#{@players[0].name[1,0]} : #{@players[0].life}/3 vs #{@players[1].name[1,0]} : #{@players[1].life}/3"
        else
          puts "#{@active_player.name} : Seriously? No!"
          @active_player.minuslife
          puts "#{@players[0].name[1,0]} : #{@players[0].life}/3 vs #{@players[1].name[1,0]} : #{@players[1].life}/3"
        end
    end
end