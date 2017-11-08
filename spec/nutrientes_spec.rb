require "spec_helper"

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
				expect(@ejemplo.to_s).to eq("Nombre: Ejemplo, Proteinas: 10gr, Glúcidos: 5gr, Lipidos: 1gr")
			end
		end
		describe "#Metodos para obtener el valor energético de un alimento" do
			it"Metodo que retorna valor energético" do
				expect(@ejemplo.v_energetico).to eq(69)
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
  		end
  		it"Leche vaca"do
  			expect(@leche.class).to eq(HLH)
  			expect(@leche.class.superclass).to eq(Alimento)
  			expect(@leche.instance_of? HLH).to eq(true)
  		end
  		it"Yogurt"do
  			expect(@yogurt.class).to eq(HLH)
  			expect(@yogurt.class.superclass).to eq(Alimento)
  			expect(@yogurt.instance_of? HLH).to eq(true)
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
  		end
  		it"Ternera"do
  			expect(@Ternera.class).to eq(CarnesyDerivados)
  			expect(@Ternera.class.superclass).to eq(Alimento)
  			expect(@Ternera.instance_of? CarnesyDerivados).to eq(true)
  		end
  		it"Pollo"do
  			expect(@Pollo.class).to eq(CarnesyDerivados)
  			expect(@Pollo.class.superclass).to eq(Alimento)
  			expect(@Pollo.instance_of? CarnesyDerivados).to eq(true)
  		end
  	end
  end
end
