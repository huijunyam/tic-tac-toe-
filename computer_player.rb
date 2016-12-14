class ComputerPlayer
    attr_reader :name, :board 
    attr_accessor :mark 
    
    def initialize(name)
        @name = name 
    end 
    
    def display(board)
        @board = board
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
        puts ""
    end 
    
    def get_move 
        winning_move? || check_empty?.sample
    end 
    
    private 
    def winning_move? 
        check_empty?.each do |pos|
            board[pos] = mark 
            if board.winner != nil 
                board[pos] = nil 
                return pos 
            else 
                board[pos] = nil 
            end 
        end 
        nil 
    end 
        
    def check_empty?
        empty_grid = []
        board.grid.length.times do |row|
            board.grid[row].length.times do |col|
                empty_grid << [row, col] if board[[row, col]] == nil 
            end 
        end 
        empty_grid
    end 
end
