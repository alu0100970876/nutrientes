
Node = Struct.new(:value, :next_, :prev)

class Lista
    attr_reader :head, :tail
    
    def initialize(val)
        @head = Node.new(val, nil, nil)
        @tail = @head
    end
    
    def insertar_nodo_cola(val)
        aux = Node.new(val,nil,@tail)
        @tail.next_ = aux
        @tail = aux
    end
    
    def insertar_nodo_head(val)
        aux = Node.new(val,@head,nil)
        @head.prev = aux
        @head = aux
    end
    
    def extraer_head
       dummy = @head.value 
       @head = @head.next_
       return dummy
    end
    
    def extraer_cola
       dummy = @tail.value 
       @tail = @tail.prev
       return dummy
    end
    
    def to_s
       string = "("
       dummy = @head
       while (dummy != nil) do
           string += "#{dummy.value.to_s},"
           dummy = dummy.next_
       end
       string += ")"
       return string
    end
    
end