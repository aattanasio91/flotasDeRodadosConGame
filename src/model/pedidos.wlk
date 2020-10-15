class Pedidos {
	
	var property distancia
	var property tiempoMaxViaje
	var property cantPasajeros
	var property coloresIncompatibles = []
	
	
	method velocidadRequerida(){
		return distancia/tiempoMaxViaje
	}
	
	method puedeSatisfacerViaje(auto){
		return auto.velMax() > self.velocidadRequerida() + 10 
			and auto.capacidad() >= self.cantPasajeros()
			and not coloresIncompatibles.any({ color => color == auto.color() }) 
	}
	
	method acelerar(){
		self.tiempoMaxViaje(self.tiempoMaxViaje() - 1)
	}
	
	method relajar(){
		self.tiempoMaxViaje(self.tiempoMaxViaje() + 1)
	}
}

