      #### - this is our diagonals
      
      # if diags_move       
        #     s_x,s_y = pos

        #     x_i = 1
        #     new_x = s_x
        #     until new_x == 0
        #         new_x = s_x - x_i
        #         if (new_x) > 0
        #             if @board[new_x][y-x_i] != NullPiece  # Top Left
        #                 diags << @board[new_x][y-x_i]
        #             end
        #             if @board[new_x][y+x_i] != NullPiece  # Bot Left
        #                 diags << @board[new_x][y+x_i]
        #             end
        #         end
        #         x_i += 1
        #     end

        #     # until s_y == 0

        #     # end

        # end



        until maybe_valid.length >  ###    
            current_pos = maybe_valid.shift
            cur_x, cur_y = current_pos
            self.move_dirs.each do |move|
                x,y = move
                new_pos = [cur_x + x, cur_y + y]
                if @board[new_pos[0]][new_pos[1]].is_a?(NullPiece)
                maybe_valid << new_pos ## QUESTION <<
                valid_moves << new_pos
            else
                next
            end
        end