require "spec_helper"

RSpec.describe Nutrientes do
  it "has a version number" do
    expect(Nutrientes::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end

  describe Alimento do
	before :each do
    		@ejemplo = Alimento.new("Ejemplo", 10, 5, 1)
  	end 

	describe "#Se almacenan los datos" do
    		it "Se almacena correctamente el nombre" do
      			expect(@ejemplo.nombre).to eq("Ejemplo") 
    		end
  	end
  end
end
