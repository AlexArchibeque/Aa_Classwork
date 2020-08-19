require_relative "./piece.rb"

class Board
    attr_reader :board

    def self.populate_board
        board = Array.new(8) { Array.new(8) }
        (0..7).each do |i|

            board[1][i] = Pawn.new("white")
            board[6][i] = Pawn.new("black")

            if i == 0 || i == 7
                board[0][i] = Rook.new("white")
                board[7][i] = Rook.new("black")
            elsif i == 1 || i == 6
                board[0][i] = Knight.new("white")
                board[7][i] = Knight.new("black")
            elsif i == 2 || i == 5
                board[0][i] = Bishop.new("white")
                board[7][i] = Bishop.new("black")
            elsif i == 3 
                board[0][i] = Queen.new("white")
                board[7][i] = King.new("black")
            else 
                board[0][i] = King.new("white")
                board[7][i] = Queen.new("black")
            end
        end

        board.each_with_index do |row,row_i|
            row.each_with_index do |pos,col_i|
                if pos == nil
                    board[row_i][col_i] = NullPiece.new("Zed")
                end
            end
        end

        board
    end

    def initialize
        @board = Board.populate_board
    end

    def [](pos)
        x, y = pos
        @board[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @board[x][y] = val
    end

    def move_piece(s_pos, e_pos) # [0,1] [2,2]
        if valid_pos?(s_pos) && valid_pos?(e_pos)
            self[s_pos], self[e_pos] = self[e_pos],self[s_pos]
        end
    end

    def valid_pos?(pos)
        x,y = pos
        if self[pos].is_a?(NullPiece)
            raise "That is not a space to move, its null"
        elsif x <=> 0 >= 0 && x
    end

    # raise errors for 
    # out of bounds
    # nil
    
end


b = Board.new

p b[[0,0]]
p b.move_piece([0,0],[7,7])
p b[[0,0]]
p b[[7,7]]