require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
    attr_reader :player1, :player2, :board
    attr_accessor :current_player
    
    def initialize(player1, player2)
        @board = Board.new
        @player1 = player1
        @player2 = player2
        @current_player = player1
        player1.mark = :X
        player2.mark = :O
    end
    
    def play_turn 
        current_player.display(board)
        begin 
            board.place_mark(current_player.get_move, current_player.mark)
        rescue 
            puts "The coordinate is occupied. Try again"
            retry
        end 
        switch_players!
    end 
    
    def switch_players!
        current_player == player1 ? self.current_player = player2 : self.current_player = player1
    end
    
    def play 
        until board.over?  
            play_turn
        end
        
        if board.winner == player1.mark
            player1.display(board)
            puts "#{player1.name} won!!!"
        elsif board.winner == player2.mark
            player2.display(board)
            puts "#{player2.name} won!!!"
        else 
            puts "is tied!!!"
        end 
    end 
end

if __FILE__ == $PROGRAM_NAME
    Game.new(HumanPlayer.new("James"), ComputerPlayer.new("Mirror")).play
end 