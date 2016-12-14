require "byebug"

class Board
    attr_reader :grid 
    
    def initialize(grid = nil)
        grid ||= Array.new(3) { Array.new(3) }
        @grid = grid
    end 
    
    def [](pos)
        row, col = pos 
        grid[row][col]
    end 
    
    def []=(pos, mark)
        row, col = pos 
        grid[row][col] = mark 
    end 
        
    def place_mark(pos, mark)
        raise "error" if !empty?(pos)
        self[pos] = mark 
    end 
    
    def empty?(pos)
        self[pos].nil? 
    end 
    
    def winner 
        horizontal || vertical || diagonal    
    end 
        
    def check(array)
        array.each do |row| 
            if row.all? { |val| val == :X } 
                return :X
            elsif row.all? { |val| val == :O }
                return :O
            end 
        end
        nil 
    end 
    
    def horizontal
        check(grid)
    end 
    
    def vertical 
        check(grid.transpose)
    end 
    
    def diagonal
        left_diagonal = [[0, 0], [1, 1], [2, 2]]
        right_diagonal = [[0, 2], [1, 1], [2, 0]]
        
        if left_diagonal.all? { |pos| self[pos] == :X } || right_diagonal.all? { |pos| self[pos] == :X }
            :X
        elsif left_diagonal.all? { |pos| self[pos] == :O } || right_diagonal.all? { |pos| self[pos] == :O }
            :O
        else 
            nil 
        end 
    end 
    
    def over?
        return true if winner != nil 
        
        grid.each do |row|
            row.each { |col| return false if col == nil }
        end 
        true 
    end 
end
