class Alimento
	
	attr_reader :nombre, :proteinas, :glucidos

	def initialize(nombre, p, g, l)
		@nombre = nombre
		@proteinas = p
		@glucidos = g
	end
end
