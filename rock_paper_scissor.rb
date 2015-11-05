class RockPaperScissor
  def initialize(player_score=0, computer_score=0)
    @player_score = 0
    @computer_score = 0
  end

  def player
    @player = player
  end

  def computer
    @computer = ["rock", "paper", "scissor"].sample
  end

  def input
    arr = %w(rock paper scissor q)
    input = ''
    until arr.include?(input)
      puts "\nRock, Paper, Scissor? (or 'q' to quit)"
      input = gets.strip.downcase
      exit if input == 'q'
    end
    input
  end

  def play
    dash = ("-") * 17
    puts "\nFirst to three wins!\n"
    until winner?(@player_score, @computer_score)
      @player = input
      computer
      puts dash
      print_choices(@player, @computer)
      won?(@player, @computer)
      puts dash
      scoreboard(@player_score, @computer_score)
    end
  end

  def print_choices(player, computer)
    puts "Player: #{player.capitalize}"
    puts "Computer: #{computer.capitalize}"
  end

  def scoreboard(player_score, computer_score)
    puts "Player score: #{player_score}"
    puts "Computer score: #{computer_score}"
  end

  def won?(player, computer)
    if player == computer
      puts "It's a tie!"
    elsif player == "rock" 
      if computer == "scissor"
        puts "You won!"
        @player_score += 1
      else
        puts "The computer won."
        @computer_score += 1
      end
    elsif player == "paper"
      if computer == "rock"
        puts "You won!"
        @player_score += 1
      else 
        puts "The computer won."
        @computer_score += 1
      end
    elsif player == "scissor"
      if computer == "rock"
        puts "The computer won."
        @computer_score += 1
      else
        puts "You won!"
        @player_score += 1
      end
    end 
    winner?(@player_score, @computer_score)
  end

  def winner?(player_score, computer_score)
    if player_score == 3
      puts "You defeated the computer!"
      exit
    elsif computer_score == 3
      puts "The computer has defeated you."
      exit
    end
  end
end

game = RockPaperScissor.new

game.play
