
Node = Struct.new(:value, :next_, :prev)
class Lista_alim
    attr_reader :Node
    
    def initialize(val)
        @Head = Node.new(val, nil, nil)
    end
    
    def insertar_nodo(val)
        sig = @Head.next_
        prev = nil
        while (sig != nil)
            prev = sig
            sig = sig.next
        end
        dummy = Node.new(:value, :next_, :prev)
        dummy.value = val
        dummy.prev = sig
        sig.next =  dummy;
    end
    
    def extraer_head
       dummy = @Head.value 
       @Head = @Head.next_
       return dummy
    end
    
    def extraer_fin
        sig = @Head.next_
        prev = nil
        while (sig != nil)
            prev = sig
            sig = sig.next_
        end
        dummy = sig.value
        sig = sig.prev
        sig.next_ =  nil
        return dummy
    end
end