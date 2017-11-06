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
  
  describe Lista_alim do
  	
  	before :each do
    		@ejemplo = Lista_alim.new()
  	end 
  	describe "#Existencia de un nodo" do
  		expect(@ejemplo.Node).to exist
  	end
  end
end
