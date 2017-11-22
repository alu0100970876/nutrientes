Node = Struct.new(:value, :next_, :prev)

# @author Miguel Jiménez Gomis
# Esta clase representa una lista doblemente enlazada
class Lista
    include Enumerable
    
    #Esto permite la lectura de la cola y la cabeza de la lista
    attr_reader :head, :tail
    
    def initialize(val)
        @head = Node.new(val, nil, nil)
        @tail = @head
    end
    
    # Inserta un nodo al final de la cola
	#
	# @param val  Cualquier objeto que se quiera como valor
    def insertar_nodo_cola(val)
        aux = Node.new(val,nil,@tail)
        @tail.next_ = aux
        @tail = aux
    end
    
    # Inserta un nodo al inicio de la cola
	#
	# @param val  Cualquier objeto que se quiera como valor
    def insertar_nodo_head(val)
        aux = Node.new(val,@head,nil)
        @head.prev = aux
        @head = aux
    end
    
    # Extrae el nodo final inicial
	#
	# @return  retorna el primer nodo de la lista
    def extraer_head
       dummy = @head.value 
       @head = @head.next_
       @head.prev = nil
       return dummy
    end
    
    # Extrae el nodo final de la lista
	#
	# @return  retorna el ultimo nodo de la lista
    def extraer_cola
       dummy = @tail.value 
       @tail = @tail.prev
       @tail.next_ = nil
       return dummy
    end
    
    # Convierte a un string formateado la lista doblemente enlazada
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
    
    # Metodo each para que la clase sea enumerable
    def each
       actual = @head
       while actual != nil do
           yield actual.value
           actual = actual.next_
       end
    end
    
end