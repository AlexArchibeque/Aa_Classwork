class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = Array.new
    end

    def parent=(node)
        if node == nil
            @parent = nil
        elsif @parent == nil
            @parent = node
            node.children << self
        else
            @parent.children.delete(self)
            @parent = node
            node.children << self
        end

    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        if !node.is_a?(PolyTreeNode) || !@children.include?(node)
            raise "This is a real error"
        end
        node.parent = nil
    end   
end

def dfs

end