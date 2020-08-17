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
        if @children.include?(node)
            node.parent = nil
        else
            raise "Error, not a Child"
        end
    end
    
    def dfs(target)
        return nil if self.nil?
        return self if self.value == target

        @children.each do |node|
            result = node.dfs(target)
            if result != nil
                return result
            end
        end
        nil
    end

    def bfs(target)
        queue = [self]

        until queue.empty?
            el = queue.shift
            if el.value == target
                return el
            end
            el.children.each { |node| queue << node }
        end

        nil
    end
end

