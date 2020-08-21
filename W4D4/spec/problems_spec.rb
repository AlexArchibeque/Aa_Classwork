require 'rspec'
require 'problems'


# describe 'my_uniq' do
#     it 'Returns unique elements in which they first appear' do
#         expect(my_uniq([1, 2, 1, 3, 3])).to eq([1,2,3])
#     end
# end

# describe "two_sum" do 
#     it 'finds all pairs of positions where the elements at those positions sum to zero' do 
#         expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]]) # [[2,3], [0,4]]
#     end
# end

# describe 'my_transpose' do 
#     it 'Convert the rows and column oriented representations' do

#     arr = [
#         [1,2,3],
#         [1,2,3],
#         [1,2,3]
#     ]
#     solved = [
#         [1,1,1],
#         [2,2,2],
#         [3,3,3]
#     ]

#         expect(my_transpose(arr)).to eq(solved)
#     end
# end

# describe 'stock_picker' do 
#     it "finds the most profitable pair of days given a sorted list of stock prices" do
#         stock_price = [20000, 1500, 35000, 4, 50]
#         expect(stock_picker(stock_price)).to eq([1,2])
#     end
# end

# board is an array = [ [4,3,2,1],
#                            [],
#                            [] ]

describe HanoiGame do
    subject(:game) { HanoiGame.new(4) } # :game = HanoiGame.new(4)

    describe '#initialize' do 
        it 'should set the board to an array with 3 distinct arrays within' do
            expect(game.board.length).to eq(3)
            expect(game.board[0]).not_to be(game.board[1])
        end

        it 'set the first array to a length n, of decending numbers.' do
            expect(HanoiGame.new(4).board).to eq([[4,3,2,1],[],[]])
            expect(HanoiGame.new(5).board).to eq([[5,4,3,2,1],[],[]])
        end
        
        it 'raises an error when given a non-integer quantity' do
            expect {HanoiGame.new("five")}.to raise_error(NotAnIntegerError)
        end

        it 'sets game_won to false' do
            expect(game.game_won).to be(false)
        end
    end

    
    describe '#valid_pos?' do 
        it 'check the input given from a user' do
            expect(game.valid_pos?([0,2])).to eq(true)
            expect(game.valid_pos?([1,2])).to eq(true)
            expect(game.valid_pos?([4,3])).to eq(false)
            expect(game.valid_pos?([1,10])).to eq(false)
        end
    end 

    describe '#move' do      
        it 'take the top disc and move it to where user input' do     
            game.move([0,2]) 
            expect(game.board).to eq([[4,3,2],[],[1]])
            game.move([0,1])
            expect(game.board).to eq([[4,3],[2],[1]])
            game.move([1,2])
            expect(game.board).to eq([[4,3],[],[1,2]])
        end


        it 'raises an error if trying to move nothing off of a place' do
            expect{game.move([1,2])}.to raise_error("Invalid position bro")
            expect{game.move([2,0])}.to raise_error("Invalid position bro")
        end
    end

    
    describe '#won?' do
        it "checks if you've won" do
            game.board = [ [], [], [4,3,2,1] ]
            expect(game.won?).to eq(true)
            game.board = [ [], [4,3,2,1], [] ]
            expect(game.won?).to eq(true)         
        end
    end

    # describe '#play' do
    #     #game.game_won = true 
    #     it 'needs to call move' do
    #         game.game_won = true 
    #         expect(game).to receive(:move) 
    #         game.play
    #     end

    #     it 'needs to call get_input' do
    #         #game.game_won = true
    #         expect(game).to receive(:get_input)  ## 
    #         game.play         
    #     end

    #     it 'needs to call won?' do
    #         #game.game_won = true
    #         expect(game).to receive(:won?) 
    #         game.play
    #     end

    #     it 'needs to call render' do
    #         #game.game_won = true 
    #         expect(game).to receive(:render) 
    #         game.play
    #     end
    # end

    describe '#render' do
        # it 'renders out a board for reference to a player' do
        #     expect(game.render).to include('Row')
        # end
    end

end
