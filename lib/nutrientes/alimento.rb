class Alimento
	
	attr_reader :nombre, :proteinas

	def initialize(nombre, p, g, l)
		@nombre = nombre
		@proteinas = p
	end
end
