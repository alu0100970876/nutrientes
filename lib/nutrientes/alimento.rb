# @author Miguel Jiménez Gomis 
# Esta clase representa a un alimento 
class Alimento
	
	include Comparable
	
	#Permite la lectura de estas variables
	attr_reader :nombre, :proteinas, :glucidos, :lipidos, :indexglucosa

	def initialize(nombre, p, g, l)
		@nombre = nombre
		@proteinas = p
		@glucidos = g
		@lipidos = l
		@indexglucosa = nil
	end
	
	#Calcula el indice glucemico de un alimento
	#
	# @param data [Array] Vector con los datos glucemicos de los alimentos
	# @param glucosa [Array] Vector con los datos de la gluco
	def calculate_index(data, glucosa)
		aibc = []
		aibc_gluc = []
		data.each do |x|
			t = 0
			x.each_index do |a| 
				if (a  != 0) 
					t += (((x[a] - x[0]) + (x[a - 1] - x[0])) /2)*5  
				end 
			end 
			aibc << t
		end
		glucosa.each do |x|
			t = 0
			x.each_index do |a| 
				if (a  != 0) 
					t += (((x[a] - x[0]) + (x[a - 1] - x[0])) /2)*5
				end 
			end 
			aibc_gluc << t
		end
		
		#aibc.each{|x| x = x/48}
		#aibc_gluc.each{|x| x = x/48}
		igind = []
		aibc.each_index { |x|  igind << ((aibc[x] / aibc_gluc[x]) * 100)}
		
		#suma = 0
		#igind.each{ |x| suma += x}
		#@indexglucosa = (suma / igind.length)
		@indexglucosa = igind.sum / igind.length
		#@indexglucosa = igind.reduce('+') / igind.length version 2.3.0 de ruby
	end
	
	# Converts the object into a string
	def to_s()
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr, Valor energetico = #{v_energetico()}"
	end
	
	# Este metodo calcula el valor energetico de un alimento
	# @return [Integer] El calculo del valor energetico.
	def v_energetico()
		return (@proteinas * 4 + @glucidos * 4 + @lipidos * 9)
	end
	
	# Operador <=> para el modulo Comparable
	#
	# @param anOther [Alimento] Otro objeto de tipo alimento
	# @return [bool] -1 menor, 0 igual, 1 mayor.
	def <=>(anOther)
		return self.v_energetico <=> anOther.v_energetico
	end
end

class HLH < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	# Converts the object into a string
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Huevos, lácteos y helados, Valor energetico = #{v_energetico()}"
	end
end

class CarnesyDerivados < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	# Converts the object into a string
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Carnes y derivados, Valor energetico = #{v_energetico()}"
	end
end

class Pescadosymariscos < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	# Converts the object into a string
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: pescados y mariscos, Valor energetico = #{v_energetico()}"
	end
end

class AlimentosGrasos < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	# Converts the object into a string
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Alimentos Grasos, Valor energetico = #{v_energetico()}"
	end
end

class AlimentosRenC < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	# Converts the object into a string
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Alimentos ricos en carbohidratos, Valor energetico = #{v_energetico()}"
	end
end

class VeyHo < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	# Converts the object into a string
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Verduras y Hortalizas,Valor energetico = #{v_energetico()}"
	end
end

class Frutas < Alimento
	def initialize(nombre, p, g, l)
		super(nombre, p, g, l)
	end
	
	# Converts the object into a string
	def to_s
		return "Nombre: #{@nombre}, Proteinas: #{@proteinas}gr, Glúcidos: #{@glucidos}gr, Lipidos: #{@lipidos}gr Grupo: Frutas,Valor energetico = #{v_energetico()}"
	end
end

