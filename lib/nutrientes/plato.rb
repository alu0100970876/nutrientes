class Plato
  @@list = [HLH.new("Huevo frito", 14.1, 0.0, 19.5),
      HLH.new("Leche vaca", 3.3, 4.8, 3.2),
      HLH.new("Yogurt", 3.8, 4.9, 3.8),
      CarnesyDerivados.new("Cerdo", 21.5, 0.0, 6.3),
      CarnesyDerivados.new("Ternera", 21.1, 0.0, 3.1),
      CarnesyDerivados.new("Pollo", 20.6, 0.0, 5.6),
      Pescadosymariscos.new("Bacalao", 17.7, 0.0, 0.4),
      Pescadosymariscos.new("Atun", 21.5, 0.0, 15.5),
      Pescadosymariscos.new("Salmon", 19.9, 0.0, 13.6),
      AlimentosGrasos.new("Aceite de oliva", 0.0, 0.2, 99.6),
      AlimentosGrasos.new("Mantequilla", 0.7, 0.0, 83.2),
      AlimentosGrasos.new("Chocolate", 5.3, 47.0, 30.0),
      AlimentosRenC.new("Azucar", 0.0, 99.8, 0.0),
      AlimentosRenC.new("Arroz", 6.8, 77.7, 0.6),
      AlimentosRenC.new("Lentejas", 23.5, 52.0, 1.4),
      AlimentosRenC.new("Papas", 2.0, 15.4, 0.1),
      VeyHo.new("Tomate", 1.0, 3.5, 0.2),
      VeyHo.new("Cebolla", 1.3, 5.8, 0.3),
      VeyHo.new("Calabaza", 1.1, 4.8, 0.1),
      Frutas.new("Manzana", 0.3, 12.4, 0.4),
      Frutas.new("Platanos", 1.2, 21.4, 0.2),
      Frutas.new("Pera", 0.5 ,12.7, 0.3)]
  @@cantidades = { "pieza_pequeña" => 5,
                  "pieza" => 10,
                  "taza" => 15,
                  "cucharón" => 20,
                  "cucharada" => 3,
                  "gramo" => 1,
                  "gramos" => 1
  }
  
  attr_accessor :name, :ingredients
  
  def initialize(name, &block)
    @name = name
    @ingredients = []
    if block_given?  
      if block.arity == 1
        yield self
      else
       instance_eval(&block) 
      end
    end
  end

  def to_s
    output = @name
    output << "\n#{'=' * @name.size}\n\n"
    @acumulador = 0
    @ingredients.each_index do |i|
        @acumulador += (@ingredients[i][1] * @ingredients[i][0].v_energetico)
        output << "\n#{@ingredients[i][0].nombre}    #{@ingredients[i][0].proteinas}    #{@ingredients[i][0].glucidos}    #{@ingredients[i][0].lipidos}    #{@ingredients[i][1] * @ingredients[i][0].v_energetico}"
    end
    output << "\nTotal:    #{@acumulador}"
    output
  end

  def vegetal(object, options = {})
    #hash con los alimentos
    #hash con las cantidades
    #funcion de conversion de cantidad a gramos
    ingredient = []
    dummy = Alimento.new("Error 404", 0, 0, 0)
    @@list.each do |x|
      if(x.nombre == object)
         dummy = x
        break
      end
    end
    ingredient << dummy
    cantidad = @@cantidades[options.split[1]]
    cantidad *= options.split[0].to_i
    ingredient << cantidad
    @ingredients << ingredient
  end
  
  def fruta(object, options = {})
    #hash con los alimentos
    #hash con las cantidades
    #funcion de conversion de cantidad a gramos
    ingredient = []
    dummy = Alimento.new("Error 404", 0, 0, 0)
    @@list.each do |x|
      if(x.nombre == object)
         dummy = x
        break
      end
    end
    ingredient << dummy
    cantidad = @@cantidades[options.split[1]]
    cantidad *= options.split[0].to_i
    ingredient << cantidad
    @ingredients << ingredient
  end
  
  def cereal(object, options)
    #hash con los alimentos
    #hash con las cantidades
    #funcion de conversion de cantidad a gramos
    ingredient = []
    dummy = Alimento.new("Error 404", 0, 0, 0)
    @@list.each do |x|
      if(x.nombre == object)
         dummy = x
        break
      end
    end
    ingredient << dummy
    cantidad = @@cantidades[options.split[1]]
    cantidad *= options.split[0].to_i
    ingredient << cantidad
    @ingredients << ingredient
  end
  
  def proteinas(object, options)
    #hash con los alimentos
    #hash con las cantidades
    #funcion de conversion de cantidad a gramos
    ingredient = []
    dummy = Alimento.new("Error 404", 0, 0, 0)
    @@list.each do |x|
      if(x.nombre == object)
         dummy = x
        break
      end
    end
    ingredient << dummy
    cantidad = @@cantidades[options.split[1]]
    cantidad *= options.split[0].to_i
    ingredient << cantidad
    @ingredients << ingredient
  end
  
  def aceite(object, options)
   #hash con los alimentos
    #hash con las cantidades
    #funcion de conversion de cantidad a gramos
    ingredient = []
    dummy = Alimento.new("Error 404", 0, 0, 0)
    @@list.each do |x|
      if(x.nombre == object)
         dummy = x
        break
      end
    end
    ingredient << dummy
    cantidad = @@cantidades[options.split[1]]
    cantidad *= options.split[0].to_i
    ingredient << cantidad
    @ingredients << ingredient
  end
end