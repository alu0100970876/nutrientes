class Alimento
	
	attr_reader :nombre, :proteinas, :glucidos, :lipidos

	def initialize(nombre, p, g, l)
		@nombre = nombre
		@proteinas = p
		@glucidos = g
		@lipidos = l
	end

	def to_s()
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr"
	end
end
