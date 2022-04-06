require './player'

class Game

  def initialize
    @player1 = Player.new('player 1')
    @player2 = Player.new('player 2')
    @current_player = @player1
    @next_player = @player2
    
  end
  
  def next_turn

    if @current_player === @player1
      @current_player = @player2
      @next_player = @player1

    elsif @current_player === @player2
      @current_player = @player1
      @next_player = @player2
    end

  end

  def display_scores
    puts "p1: #{@player1.lives}/3 vs p2: #{@player2.lives}/3"
  end

  def question
   number1 = rand(1..20)
   number2 = rand(1..20)
   puts "#{@current_player.name}: What does #{number1} plus #{number2} equal?"
  
   print "> "
   answer = gets.chomp.to_i
   
   if answer === number1 + number2
     puts "#{@current_player.name} : YES! You are correct."

     if @current_player.lives < 3
      @current_player.lives += 1
     elsif @current_player.lives = 3
      @current_player.lives = 3
     end
    
   else 
     puts "#{@current_player.name} : Seriously? No!"
     @current_player.lose_life
   end

  end

  def play
   
   while @current_player.lives > 0 do
     puts "--------------------"
     puts "----- NEW TURN -----"
     
     question
     if @current_player.lives > 0
       display_scores
       next_turn
     else
        puts "#{@next_player.name} wins with a score of #{@next_player.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
     end
    end
  end

end  



    