class Player

  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
    
  end

 

  

end

# player1 = Player.new('player 1')
# player2 = Player.new('player 2')
# puts player1.lives