class NotAnIntegerError <  ArgumentError; end

class HanoiGame
    attr_accessor :board , :disc, :game_won

    def initialize(n)
        raise NotAnIntegerError unless n.is_a?(Integer)
        @board = Array.new(3){Array.new} # [[],[],[]]
        @game_won = false
        @discs = n 
        (1..n).reverse_each { |i| @board[0] << i }
    end

    def get_input
        puts "Hey, give me your input broskit, like '0 2'"
        input = gets.chomp 
        input = input.split.map {|num| num.to_i}
        if valid_pos?(input)
            input
        else
            false
        end
    end

    def valid_pos?(pos) # [1,2]
        (0..2).include?(pos[0]) && (0..2).include?(pos[1])
    end

    def move(pos) #[1,2]
        s, e = pos
        unless @board[s].empty?
            @board[e] << @board[s].pop
            true
        else
            raise "Invalid position bro"
            false
        end
    end

    # don't manipulate our board
    # find the states where we win

    def won?
        new_board_2 = [[],[],[]] 
        new_board_1 = [[],[],[]]
        
        (1..@discs).reverse_each do |disc|
            new_board_1[1] << disc 
            new_board_2[2] << disc 
        end

        return @game_won = true if @board == new_board_1        # [ [], [4,3,2,1], [] ]
        return @game_won = true if @board == new_board_2 
        false
    end

    def render       
        @board.each_with_index { |row,i| puts "Row: #{i} = #{row}" }
    end

    def play
        render
        until self.game_won
            move(get_input)
            won?
            render
        end

        puts "Wow you won! Nice, Broskitter."
    end
end


if $PROGRAM_NAME == __FILE__ ## if problems_spec.rb == problems.rb  ruby problems.rb
    g = HanoiGame.new(4)
    g.play
end 

# class Test
#     def test1
#         self.test2  # true
#         test3       # true
#         self.test3  # false
#     end

#     private
#     def test3
#     end

#     protected
#     def test2

#     end
# end

# Test.test1 # => true
# Test.test2 # => error
# Test.test3 # => error

























def my_uniq(arr)
    arr.uniq
end

def two_sum(arr)
    new_arr = []
    (0...arr.length).each do |i1|
        (1...arr.length).each do |i2|
            if i2 > i1
                if arr[i1] + arr[i2] == 0
                    new_arr << [i1,i2]
                end
            end
        end
    end
    new_arr
end

def my_transpose(arr)
    arr.transpose
end

def stock_picker(arr)
    profitable_days = Hash.new 

    arr.each_with_index do |el_1,i1|
        arr.each_with_index do |el_2,i2|
            if i1 < i2
                 profitable_days[el_2 - el_1] = [i1, i2]
            end
        end
    end

    profitable_days[profitable_days.keys.max]
end