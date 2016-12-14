class HumanPlayer
    attr_reader :name 
    attr_accessor :mark 
    
    def initialize(name)
        @name = name 
    end 
    
    def get_move
        puts "where to put the element"
        gets.chomp.split(", ").map(&:to_i)
    end 
    
    def display(board)
        board.grid.map do |row|
            row.map do |ele|
                if ele == :X 
                    "X"
                elsif ele == :O
                    "O"
                else 
                    " "
                end 
            end 
        end.each { |row| puts row.join(" | ") }
    end 
end
