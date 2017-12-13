require "spec_helper"
require 'benchmark'

RSpec.describe Nutrientes do
  it "has a version number" do
    expect(Nutrientes::VERSION).not_to be nil
  end

  describe Alimento do
		before :each do
    		@ejemplo = Alimento.new("Ejemplo", 10, 5, 1)
  	end
		describe "#Se almacenan los datos" do
			it "Se almacena correctamente el nombre" do
      			expect(@ejemplo.nombre).to eq("Ejemplo") 
    	end
			it "Se almacena correctamente la cantidad de proteinas en gramos" do
				expect(@ejemplo.proteinas).to eq(10)
			end
			it "Se almacena correctamente la cantidad de glúcidos en grmaos" do
				expect(@ejemplo.glucidos).to eq(5)
			end
			it "Se almacena correctamente la cantidad de lipidos en grmaos" do
   		     expect(@ejemplo.lipidos).to eq(1)
			end
  	end
		describe "#Metodos para obtener info formateada" do
			it "Metodo para obtener un alimento formateado" do
				expect(@ejemplo.to_s).to eq("Nombre: Ejemplo, Proteinas: 10gr, Glúcidos: 5gr, Lipidos: 1gr, Valor energetico = 69")
			end
		end
		describe "#Metodos para obtener el valor energético de un alimento" do
			it"Metodo que retorna valor energético" do
				expect(@ejemplo.v_energetico).to eq(69)
			end
		end
		describe "#Comparable" do
		    it "Menor" do
		        @ejemplo2 = Alimento.new("Ejemplo", 1, 1, 1)
		        expect(@ejemplo < @ejemplo2).to eq(false)
		    end
		    it "Mayor" do
		        @ejemplo2 = Alimento.new("Ejemplo", 1, 1, 1)
		        expect(@ejemplo > @ejemplo2).to eq(true)
		    end
		    it "Igual" do
		        @ejemplo2 = Alimento.new("Ejemplo", 1, 1, 1)
		        expect(@ejemplo == @ejemplo2).to eq(false)
		    end
		end
	  describe "#Indexglucosa" do
  		  it "Compota de manzana" do
  		    @comp = Alimento.new("Compota",1,1,1)
  		    dat = [[6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2 ,7.3 ,7.0 ,6.8 ,6.7, 6.8, 6.7, 6.9],[4.6 ,4.8 ,5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1 ,6.2, 6.3, 6.4 ,6.1 ,6.1 ,5.7 ,5.9]]
  		    gluc = [[4.9 ,5.3 ,5.9 ,6.7 ,7.2 ,7.6 ,8.0 ,8.2, 8.2 ,8.4 ,8.3 ,8.3 ,8.0 ,7.5, 7.1, 6.8 ,6.8 ,6.9, 6.8, 6.3 ,6.2 ,6.3 ,6.2 ,6.3, 6.1],[6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4 ,10.8 ,10.5, 9.1, 8.9, 8.3, 7.7, 7.6 ,7.5]]
  		    @comp.calculate_index(dat,gluc)
  		    expect(@comp.indexglucosa).to eq(54.499780077077745)
  		  end
  		  it "Yogurt" do
  		    @yog = Alimento.new("Yogurt",1,1,1)
  		    dat = [[6.1, 6.6, 6.3, 6.3 ,6.1 ,6.9, 6.8, 6.5, 6.4, 6.9, 6.8, 6.5, 6.3, 6.2, 6.7, 6.2, 5.9 ,5.8, 5.8, 5.8, 5.8 ,5.8 ,5.9 ,6.2, 6.4],[4.9, 4.9, 5.2, 5.8, 6.5, 7.0, 7.2, 7.3, 7.3, 6.6, 6.2, 6.1, 6.0, 6.1, 5.9, 5.9, 5.9 ,5.9, 5.8, 5.8, 5.5, 5.5, 5.6 ,5.9, 5.9]]
  		    gluc = [[4.9 ,5.3 ,5.9 ,6.7 ,7.2 ,7.6 ,8.0 ,8.2, 8.2 ,8.4 ,8.3 ,8.3 ,8.0 ,7.5, 7.1, 6.8 ,6.8 ,6.9, 6.8, 6.3 ,6.2 ,6.3 ,6.2 ,6.3, 6.1],[6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4 ,10.8 ,10.5, 9.1, 8.9, 8.3, 7.7, 7.6 ,7.5]]
  		    @yog.calculate_index(dat,gluc)
  		    expect(@yog.indexglucosa).to eq(41.37941416722519)
  		  end
  		  it "Chocolate" do
  		    @yog = Alimento.new("Chocolate",1,1,1)
  		    dat = [[6.5, 6.5, 6.7, 6.5, 6.5, 6.8, 6.7, 6.2, 6.5, 7.2, 6.9, 7.0, 6.3 ,6.2, 6.1 ,5.9 ,5.8 ,6.1, 6.7, 6.7, 6.6 ,6.7 ,6.9 ,7.2, 7.1],[4.6, 4.6, 4.7, 4.7, 4.8, 4.7, 4.8, 4.8, 4.6, 4.4, 4.7, 4.7, 4.8, 4.7, 5.2, 5.9, 5.9, 5.7, 5.4, 5.3, 5.1, 4.8, 4.8, 4.9, 5.9]]
  		    gluc = [[4.9 ,5.3 ,5.9 ,6.7 ,7.2 ,7.6 ,8.0 ,8.2, 8.2 ,8.4 ,8.3 ,8.3 ,8.0 ,7.5, 7.1, 6.8 ,6.8 ,6.9, 6.8, 6.3 ,6.2 ,6.3 ,6.2 ,6.3, 6.1],[6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4 ,10.8 ,10.5, 9.1, 8.9, 8.3, 7.7, 7.6 ,7.5]]
  		    @yog.calculate_index(dat,gluc)
  		    expect(@yog.indexglucosa).to eq(13.328114527479904)
  		  end
		end
  end
  
  describe Lista do
  	before :each do
  		  @value = 1
  			#@alim = Alimento.new("Ejemplo", 10, 5, 1)
    		@en = Lista.new(@value)
    		#@ejemplo = Lista.new(@alim)
  	end 
  	context "Pruebas de la creación de listas" do
  		it "Se ha creado bien la lista" do
  			expect(@en).not_to eq(nil)
  		end
  		it "devuelve la cabeza" do
  			expect(@en.head).not_to eq(nil)
  		end
  		it "devuelve la cola" do
  			expect(@en.tail).not_to eq(nil)
  		end
  	end
  	context "#Métodos de la lista" do
  		it "Insertar nodo cola" do
  		  nuevo = 2
  		  @en.insertar_nodo_cola(nuevo)
  		  expect(@en.tail.value).to eq(nuevo)
  	  end
  	  it "Insertar nodo head" do
  	  	nuevo = 2
  	  	@en.insertar_nodo_head(nuevo)
  	  	expect(@en.head.value).to eq(nuevo)
  	  end
  	  it "Extraer cabeza"do
  	  	nuevo = 2
  		  @en.insertar_nodo_cola(nuevo)
  		  expect(@en.extraer_head).to eq(1)
  	  end
  	  it "Extraer cola" do
  	  	nuevo = 2
  		  @en.insertar_nodo_head(nuevo)
  		  expect(@en.extraer_cola).to eq(1)
  	  end
  	  it "to_s funcional"do
  	  	nuevo = 2
  		  @en.insertar_nodo_cola(nuevo)
  		  expect(@en.to_s).to eq("(1,2,)")
  	  end
    end
    context "Enumerable" do
        it "Sumar todos los elementos de la lista" do
            nuevo= 2
            @en.insertar_nodo_cola(nuevo)
            nuevo = 3
            @en.insertar_nodo_cola(nuevo)
            nuevo = 4
            @en.insertar_nodo_cola(nuevo)
            val = 0
            @en.each { |i| val += i }
            expect(val).to eq(10)
        end
        it"Max"do
            nuevo= 2
            @en.insertar_nodo_cola(nuevo)
            nuevo = 3
            @en.insertar_nodo_cola(nuevo)
            nuevo = 4
            @en.insertar_nodo_cola(nuevo)
            expect(@en.max).to eq(4)
        end
    end
  end
  
  describe HLH do
  	before :each do
  		  @huevo_f = HLH.new("Huevo frito", 14.1, 0.0, 10.5)
  		  @leche = HLH.new("Leche vaca", 3.3, 4.8, 3.2)
  		  @yogurt = HLH.new("Yogurt", 3.8, 4.9, 3.8)
  	end 
  	context "Pruebas para Huevos lacteos y Helados"do
  		it"Huevo frito"do
  			expect(@huevo_f.class).to eq(HLH)
  			expect(@huevo_f.class.superclass).to eq(Alimento)
  			expect(@huevo_f.instance_of? HLH).to eq(true)
  			expect(@huevo_f.is_a? HLH).to eq(true)
  		end
  		it"Leche vaca"do
  			expect(@leche.class).to eq(HLH)
  			expect(@leche.class.superclass).to eq(Alimento)
  			expect(@leche.instance_of? HLH).to eq(true)
  			expect(@leche.is_a? HLH).to eq(true)
  		end
  		it"Yogurt"do
  			expect(@yogurt.class).to eq(HLH)
  			expect(@yogurt.class.superclass).to eq(Alimento)
  			expect(@yogurt.instance_of? HLH).to eq(true)
  			expect(@yogurt.is_a? HLH).to eq(true)
  		end
  	end
  end
  
  describe CarnesyDerivados do
  	before :each do
  		  @Cerdo = CarnesyDerivados.new("Cerdo", 21.5, 0.0, 6.3)
  		  @Ternera = CarnesyDerivados.new("Ternera", 21.1, 0.0, 3.1)
  		  @Pollo = CarnesyDerivados.new("Pollo", 20.6, 0.0, 5.6)
  	end 
  	context "Pruebas para Carnes y derivados"do
  		it"Cerdo"do
  			expect(@Cerdo.class).to eq(CarnesyDerivados)
  			expect(@Cerdo.class.superclass).to eq(Alimento)
  			expect(@Cerdo.instance_of? CarnesyDerivados).to eq(true)
  			expect(@Cerdo.is_a? CarnesyDerivados).to eq(true)
  		end
  		it"Ternera"do
  			expect(@Ternera.class).to eq(CarnesyDerivados)
  			expect(@Ternera.class.superclass).to eq(Alimento)
  			expect(@Ternera.instance_of? CarnesyDerivados).to eq(true)
  			expect(@Ternera.is_a? CarnesyDerivados).to eq(true)
  		end
  		it"Pollo"do
  			expect(@Pollo.class).to eq(CarnesyDerivados)
  			expect(@Pollo.class.superclass).to eq(Alimento)
  			expect(@Pollo.instance_of? CarnesyDerivados).to eq(true)
  			expect(@Pollo.is_a? CarnesyDerivados).to eq(true)
  		end
  	end
  end
  
  describe Pescadosymariscos do
  	before :each do
  		  @Bacalao = Pescadosymariscos.new("Bacalao", 17.7, 0.0, 0.4)
  		  @Atun = Pescadosymariscos.new("Atun", 21.5, 0.0, 15.5)
  		  @Salmon = Pescadosymariscos.new("Salmon", 19.9, 0.0, 13.6)
  	end 
  	context "Pruebas para pescados y Mariscos"do
  		it"Bacalao"do
  			expect(@Bacalao.class).to eq(Pescadosymariscos)
  			expect(@Bacalao.class.superclass).to eq(Alimento)
  			expect(@Bacalao.instance_of? Pescadosymariscos).to eq(true)
  			expect(@Bacalao.is_a? Pescadosymariscos).to eq(true)
  		end
  		it"Atun"do
  			expect(@Atun.class).to eq(Pescadosymariscos)
  			expect(@Atun.class.superclass).to eq(Alimento)
  			expect(@Atun.instance_of? Pescadosymariscos).to eq(true)
  			expect(@Atun.is_a? Pescadosymariscos).to eq(true)
  		end
  		it"Salmon"do
  			expect(@Salmon.class).to eq(Pescadosymariscos)
  			expect(@Salmon.class.superclass).to eq(Alimento)
  			expect(@Salmon.instance_of? Pescadosymariscos).to eq(true)
  			expect(@Salmon.is_a? Pescadosymariscos).to eq(true)
  		end
  	end
  end
  
  describe AlimentosGrasos do
  	before :each do
  		  @Aceite = AlimentosGrasos.new("Aceite de oliva", 0.0, 0.2, 99.6)
  		  @Mantequilla = AlimentosGrasos.new("Mantequilla", 0.7, 0.0, 83.2)
  		  @Chocolate = AlimentosGrasos.new("Chocolate", 5.3, 47.0, 30.0)
  	end 
  	context "Pruebas para Alimentos Grasos"do
  		it"Aceite"do
  			expect(@Aceite.class).to eq(AlimentosGrasos)
  			expect(@Aceite.class.superclass).to eq(Alimento)
  			expect(@Aceite.instance_of? AlimentosGrasos).to eq(true)
  			expect(@Aceite.is_a? AlimentosGrasos).to eq(true)
  		end
  		it"Mantequilla"do
  			expect(@Mantequilla.class).to eq(AlimentosGrasos)
  			expect(@Mantequilla.class.superclass).to eq(Alimento)
  			expect(@Mantequilla.instance_of? AlimentosGrasos).to eq(true)
  			expect(@Mantequilla.is_a? AlimentosGrasos).to eq(true)
  		end
  		it"Chocolate"do
  			expect(@Chocolate.class).to eq(AlimentosGrasos)
  			expect(@Chocolate.class.superclass).to eq(Alimento)
  			expect(@Chocolate.instance_of? AlimentosGrasos).to eq(true)
  			expect(@Chocolate.is_a? AlimentosGrasos).to eq(true)
  		end
  	end
  end
  
  describe AlimentosRenC do
  	before :each do
  		  @Azucar = AlimentosRenC.new("Azucar", 0.0, 99.8, 0.0)
  		  @Arroz = AlimentosRenC.new("Arroz", 6.8, 77.7, 0.6)
  		  @Lentejas = AlimentosRenC.new("Lentejas", 23.5, 52.0, 1.4)
  		  @Papas = AlimentosRenC.new("Papas", 2.0, 15.4, 0.1)
  	end 
  	context "Pruebas para Alimentos Ricos en carbohidratos"do
  		it"Azucar"do
  			expect(@Azucar.class).to eq(AlimentosRenC)
  			expect(@Azucar.class.superclass).to eq(Alimento)
  			expect(@Azucar.instance_of? AlimentosRenC).to eq(true)
  			expect(@Azucar.is_a? AlimentosRenC).to eq(true)
  		end
  		it"Arroz"do
  			expect(@Arroz.class).to eq(AlimentosRenC)
  			expect(@Arroz.class.superclass).to eq(Alimento)
  			expect(@Arroz.instance_of? AlimentosRenC).to eq(true)
  			expect(@Arroz.is_a? AlimentosRenC).to eq(true)
  		end
  		it"Lentejas"do
  			expect(@Lentejas.class).to eq(AlimentosRenC)
  			expect(@Lentejas.class.superclass).to eq(Alimento)
  			expect(@Lentejas.instance_of? AlimentosRenC).to eq(true)
  			expect(@Lentejas.is_a? AlimentosRenC).to eq(true)
  		end
  		it"Papas"do
  			expect(@Papas.class).to eq(AlimentosRenC)
  			expect(@Papas.class.superclass).to eq(Alimento)
  			expect(@Papas.instance_of? AlimentosRenC).to eq(true)
  			expect(@Papas.is_a? AlimentosRenC).to eq(true)
  		end
  	end
  end
  
  describe VeyHo do
  	before :each do
  		  @Tomate = VeyHo.new("Tomate", 1.0, 3.5, 0.2)
  		  @Cebolla = VeyHo.new("Cebolla", 1.3, 5.8, 0.3)
  		  @Calabaza = VeyHo.new("Calabaza", 1.1, 4.8, 0.1)
  	end 
  	context "Pruebas para Verduras y Hortalizas"do
  		it"Tomate"do
  			expect(@Tomate.class).to eq(VeyHo)
  			expect(@Tomate.class.superclass).to eq(Alimento)
  			expect(@Tomate.instance_of? VeyHo).to eq(true)
  			expect(@Tomate.is_a? VeyHo).to eq(true)
  		end
  		it"Cebolla"do
  			expect(@Cebolla.class).to eq(VeyHo)
  			expect(@Cebolla.class.superclass).to eq(Alimento)
  			expect(@Cebolla.instance_of? VeyHo).to eq(true)
  			expect(@Cebolla.is_a? VeyHo).to eq(true)
  		end
  		it"Calabaza"do
  			expect(@Calabaza.class).to eq(VeyHo)
  			expect(@Calabaza.class.superclass).to eq(Alimento)
  			expect(@Calabaza.instance_of? VeyHo).to eq(true)
  			expect(@Calabaza.is_a? VeyHo).to eq(true)
  		end
  	end
  end
  
  describe Frutas do
  	before :each do
  		  @Manzana = Frutas.new("Manzana", 0.3, 12.4, 0.4)
  		  @Platanos = Frutas.new("Platanos", 1.2, 21.4, 0.2)
  		  @Pera = Frutas.new("Pera", 0.5 ,12.7, 0.3)
  	end 
  	context "Frutas"do
  		it"Manzana"do
  			expect(@Manzana.class).to eq(Frutas)
  			expect(@Manzana.class.superclass).to eq(Alimento)
  			expect(@Manzana.instance_of? Frutas).to eq(true)
  			expect(@Manzana.is_a? Frutas).to eq(true)
  		end
  		it"Platanos"do
  			expect(@Platanos.class).to eq(Frutas)
  			expect(@Platanos.class.superclass).to eq(Alimento)
  			expect(@Platanos.instance_of? Frutas).to eq(true)
  			expect(@Platanos.is_a? Frutas).to eq(true)
  		end
  		it"Pera"do
  			expect(@Pera.class).to eq(Frutas)
  			expect(@Pera.class.superclass).to eq(Alimento)
  			expect(@Pera.instance_of? Frutas).to eq(true)
  			expect(@Pera.is_a? Frutas).to eq(true)
  		end
  	end
  end
  context "Benchmarck ordenaciones"do
    before :each do
      def bs_for! (array)
        for i in 0..array.size 
          for j in i+1..array.size-1    
            array[i], array[j] = array[j], array[i] if(array[i] > array[j])
          end
        end
        #puts array
        array
      end
        
      def bs_each! (array) #con el each
        array.each do
          swap_count = 0
          array.each_with_index do |a, index|
            break if index == (array.length - 1)
            if a > array[index+1]
              array[index],array[index+1] = array[index +1], array[index]
              swap_count += 1
            end
          end
          break if swap_count == 0 # this means it's ordered
        end
        #puts array
        array
      end
      
      @list = [HLH.new("Huevo frito", 14.1, 0.0, 19.5),
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
    end
    it "Comprobación benchmark"do
      Benchmark.bmbm do |x| #funcionamiento de benchmark
         #puts @list
         x.report("Con el metodo sort")  { @list.dup.sort }
         #puts @list.dup.sort
         x.report("Con el metodo for") { bs_for!(@list.dup)}
         x.report("Con el metodo each") { bs_each!(@list.dup)}
      end
    end
  end
  
  describe Plato do
    it "Plato de ejemplo" do
      @lentejas_arroz = Plato.new("Lentejas con arroz, salsa de tomate, huevo y platano a la plancha") do
        vegetal "Tomate","2 pieza_pequeña"
        fruta "Platanos","20 gramos"
        cereal "Arroz","1 taza"
        proteinas "Lentejas","1  cucharón"
        proteinas "Huevo frito", "1 pieza"
        aceite "Aceite de oliva","1 cucharada"
        vegetal "prueba","2 pieza_pequeña"
      end
      puts @lentejas_arroz.to_s
    end
  end
end
