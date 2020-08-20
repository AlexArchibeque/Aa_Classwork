require "byebug"
require "singleton"
# to_s

class Piece
    attr_accessor :pos
    attr_reader :color, :board, :move_dirs
    

    def initialize(color,board,pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        ""
    end

    def moves
    end
end

###modules

# [0..7] [0..7]
# diagonals
# horiz/verti

module Slideable
    DIAG = [
        [ 1, 1],
        [ 1,-1],
        [-1, 1],
        [-1,-1]
    ].freeze

    HORIZ_VERT = [
        [-1,0],
        [1, 0],
        [0, 1],
        [0,-1]
    ].freeze
    
    def move_dirs 
        raise NotImplementedError
    end

    def horizontal_dirs
        HORIZ_VERT 
    end

    def diagonal_dirs
        DIAG 
    end
    
    def moves
        moves = [] 
        move_dirs.each do |dx, dy|
          moves.concat(grow_unblocked_moves_in_dir(dx, dy)) # [0,-1]
        end  
        moves.sort
    end


    def grow_unblocked_moves_in_dir(dx,dy) # [0,-1]
        #debugger

        added_arr = [] # [[3,2],[3,1]]
        x , y  = pos # 3 ,3  = [3,3]
        cons_dx = dx
        cons_dy = dy
        new_pos = [x+dx, y+dy] # new_pos = [3 , 2]
        until !@board[new_pos[0]][new_pos[1]].is_a?(NullPiece)         
            if dx+x < 0 || dy+y < 0
                break
            end
            added_arr << new_pos # 
            dx += cons_dx
            dy += cons_dy
            
            new_pos = [x+dx, y+dy] # new_pos = [3,-1]
        end
        added_arr

    end
end

module Steppable
    def move_diffs
        raise "Not Implemented"
    end
    def moves
        valid_moves = []

        move_diffs.each do |dx,dy|
            new_pos = [pos[0] + dx, pos[1] + dy]
            if @board[new_pos[0]][new_pos[1]].is_a?(NullPiece)
                valid_moves << new_pos
            end
        end
        valid_moves
    end
end

class NullPiece < Piece
    include Singleton

    def initialize
        super("ghost",board,[0,0])
    end

    def to_s
        "_"
    end
end


### Sliding
class Rook < Piece
    #include Slideable

    def to_s
        "R"
    end

    def move_dirs
        horizontal_dirs
    end

end

class Bishop < Piece
    include Slideable
    def to_s
        "B"
    end

    def move_dirs
        diagonal_dirs
    end
end

class Queen < Piece
    include Slideable

    def to_s
        "Q"
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end


### Stepable
class Knight < Piece
    include Steppable
    def to_s
        "H"
    end

    def move_diffs
        [
        [-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]
      ]
    end
end

class King < Piece
    include Steppable
    def to_s
        "K"
    end

    def move_diffs
    [
        [1,0],
        [-1,0],
        [0,1],
        [0,-1],
        [1,1],
        [1,-1],
        [-1,1],
        [-1,-1]
    ]
    end
end


### Pawns
class Pawn < Piece
    def to_s
        "P"
    end
end


