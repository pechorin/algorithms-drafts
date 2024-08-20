# frozen_string_literal: true

module Trees
  class Binary
    attr_accessor :tree
    alias root tree

    class Node
      attr_accessor :value, :left, :right

      def initialize(value)
        @value = value
      end
    end

    def initialize
      @tree = nil
    end

    def append(value, child_node = nil)
      return @tree = Node.new(value) if tree.nil?

      node = child_node || root

      if value < node.value
        if node.left
          append(value, node.left)
        else
          node.left = Node.new(value)
        end
      elsif value > node.value
        if node.right
          append(value, node.right)
        else
          node.right = Node.new(value)
        end
      else
        return tree
      end
    end
  end
end

tree = Trees::Binary.new
# tree.append(1)
# tree.append(2)
# tree.append(3)

tree.append(3)
tree.append(2)
tree.append(1)

puts(tree.inspect)
