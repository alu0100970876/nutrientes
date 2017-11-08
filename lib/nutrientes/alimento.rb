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

	def v_energetico()
		return (@proteinas * 4 + @glucidos * 4 + @lipidos * 9)
	end
end

class HLH < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Huevos, lácteos y helados"
	end
end

class CarnesyDerivados < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Carnes y derivados"
	end
end

class Pescadosymariscos < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: pescados y mariscos"
	end
end

class AlimentosGrasos < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Alimentos Grasos"
	end
end

class AlimentosRenC < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Alimentos ricos en carbohidratos"
	end
end

class VeyHo < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Verduras y Hortalizas"
	end
end

class Frutas < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Frutas"
	end
end