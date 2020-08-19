
# to_s

class Piece
    attr_reader :color

    def initialize(color)
        @color = color
    end
end

class NullPiece < Piece

end


### Sliding
class Rook < Piece

end

class Bishop < Piece

end

class Queen < Piece

end


### Stepable
class Knight < Piece

end

class King < Piece
   
end


### Pawns
class Pawn < Piece
    
end

module Slideable

end

module Stepable

end