require_relative "./polytreenode.rb"

# [0..7, 0..7]
class KnightPathFinder
    attr_reader :start_pos
    attr_accessor :root_node, :considered_positions

    MOVES = [
        [-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]
      ]

    def self.valid_moves(pos)
        valid_moves = []
        cur_x,cur_y = pos
        MOVES.each do |(dx, dy)|
            new_pos = [cur_x+dx, cur_y+dy]
            valid_moves << new_pos if new_pos.all? { |cords| cords.between?(0,7) }
        end
        valid_moves
    end

    def initialize(pos)
        @start_pos = pos
        @considered_positions = [pos]
        build_move_tree
    end

    def new_move_positions(pos) # [ [1,2], [2,1] ]
        valid_pos = KnightPathFinder.valid_moves(pos)
        filtered = valid_pos.select { |n_pos| !considered_positions.include?(n_pos) }
        filtered.each { |n_pos| considered_positions << n_pos }
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(@start_pos)

        nodes = [root_node]
        until nodes.empty?
            current_n = nodes.shift
            current_pos = current_n.value
            new_move_positions(current_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_n.add_child(next_node)
                nodes << next_node
            end
        end
    end

    def find_path(pos)
        end_node = self.root_node.dfs(pos)

        trace_back_path(end_node).reverse.map(&:value)
    end

    def trace_back_path(end_node)
        nodes = []

        current_node = end_node
        until current_node.nil?
            nodes << current_node
            current_node = current_node.parent
        end
        nodes

    end

end


kpf = KnightPathFinder.new([7,1])

p kpf.find_path([3,4])
