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

    def traverse_asc(node = root)
      return unless node

      [traverse_asc(node.left), node.value, traverse_asc(node.right)].flatten.compact
    end
  end
end

# tree = Trees::Binary.new

# tree.append(5)
# tree.append(3)
# tree.append(10)
# tree.append(1)
# tree.append(4)
# tree.append(7)
# tree.append(12)
# tree.append(11)
# tree.append(18)


# puts(tree.traverse_asc.inspect)
