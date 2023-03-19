class Node

    attr_accessor :next_node
    attr_reader   :value

    def initialize(value = nil)
        @value = value
        @next_node = nil
    end
end

class LinkedList

    attr_accessor :head
    
    def initialize
        @head = nil
    end

    def append(value)
        if @head == nil
            @head = Node.new(value)
        else
            current_node = @head
            while current_node.next_node
                current_node = current_node.next_node
            end
            current_node.next_node = Node.new(value)
        end
    end

    def prepend(value)
        if @head == nil
            @head = Node.new(value)
        else
            current_node = Node.new(value)
            current_node.next_node = @head
            @head = current_node
        end
    end

    def size
        return 0 if @head.nil?
        current_node = @head
        count = 1
        while current_node.next_node
            current_node = current_node.next_node
            count +=1
        end
        return count
    end

    def head
        return nil if @head.nil?
        return @head.value
    end

    def tail
        return nil if @head.nil?
        current_node = @head
        while current_node.next_node
            current_node = current_node.next_node
        end
        return current_node
    end

    def at(index)
        return nil if @head.nil? || index < 1
        current_node = @head
        count = 1
        until count == index
            return nil if current_node.next_node.nil?
            current_node = current_node.next_node
            count +=1
        end
        return current_node
    end

    def pop
        return nil if @head.nil?
        current_node = @head
        index = 1
        until index == self.size - 1 || self.size == 1
            current_node = current_node.next_node                   
            index +=1
        end
        current_node.next_node = nil
    end

    def contains?(value)
        current_node = @head
        while current_node
            return true if current_node.value == value
            current_node = current_node.next_node
        end
        return false
    end

    def find(value)
        current_node = @head
        index = 1
        while current_node
            return index if current_node.value == value
            current_node = current_node.next_node               
            index += 1
        end
        return nil
    end

    def to_s
    node_values = []
    current_node = @head
        while current_node
            node_values << "(#{current_node.value})"
            current_node = current_node.next_node
        end
        node_values << "nil"
        return node_values.join(" -> ")
    end

    def insert_at(value, index)
        return nil if @head.nil? || index < 1
        current_node = @head
        count = 1
        until count == index - 1 || current_node.next_node.nil?
            current_node = current_node.next_node
            count +=1
        end
        new_node = Node.new(value)
        new_node.next_node = current_node.next_node
        current_node.next_node = new_node
    end

    def remove_at(index)
        return nil if @head.nil? || index < 1
        current_node = @head
        count = 1
        return nil if index > self.size
        if index == 1
            @head = current_node.next_node
            return
        end
        until count == index - 1 || current_node.next_node.nil?
            current_node = current_node.next_node
            count +=1
        end
        current_node.next_node = current_node.next_node.next_node
    end
end
