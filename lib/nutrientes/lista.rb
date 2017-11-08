
Node = Struct.new(:value, :next_, :prev)

class Lista
    attr_reader :head, :tail
    
    def initialize(val)
        @head, @tail = Node.new(val, nil, nil)
    end
    
    def insertar_nodo_cola(val)
        aux = Node.new(val,nil,@tail)
        @tail 
        prev = nil
        while (sig != nil)
            prev = sig
            sig = sig.next_
        end
        dummy = Node.new(val, nil, sig)
        dummy.value = val
        dummy.prev = sig
        sig.next_ =  dummy
        return dummy
    end
    
    #def extraer_head
    #   dummy = @Head.value 
    #   @Head = @Head.next_
    #   return dummy
    #end
    
    #def extraer_fin
    #    sig = @Head.next_
    #    prev = nil
    #    while (sig != nil)
    #        prev = sig
    #        sig = sig.next_
    #    end
    #    dummy = sig.value
    #    sig = sig.prev
    #    sig.next_ =  nil
    #    return dummy
    #end
end