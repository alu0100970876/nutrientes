class Alimento
	
	attr_reader :nombre, :proteinas, :glucidos, :lipidos

	def initialize(nombre, p, g, l)
		@nombre = nombre
		@proteinas = p
		@glucidos = g
		@lipidos = l
	end
end
