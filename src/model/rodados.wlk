import wollok.game.*

object rojo {method image() { return "autitorojo.png" }}
object verde {method image() { return "autoVerde.jpg" }}
object azul {method image() { return "autoAzul.jpg" }}

class Corsa {
	
	var property color = null
	var property position = game.at(0,0)
	var property image = "autitorojo.png"
	var property listaPosiciones = []
	
	method capacidad() {return 4}
	method velMax() {return 150}
	method peso() {return 1300}
	
	
	method moverArriba(){
		self.position(self.position().up(1))
		listaPosiciones.add(self.position())
	}
	method moverAbajo(){
		self.position(self.position().down(1))
		listaPosiciones.add(self.position())
	}
	method moverIzquierda(){
		self.position(self.position().left(1))
		listaPosiciones.add(self.position())
	}
	method moverDerecha(){
		self.position(self.position().right(1))
		listaPosiciones.add(self.position())
	}
	
	method pasoPor(posicion){ return listaPosiciones.contains(posicion)}
	method pasoPorFila(numero) { return listaPosiciones.contains(numero)}
	method recorrioFilas(lista_de_numeros) { return listaPosiciones.contains(lista_de_numeros)} 
	
	method cambiaARojo(){
		self.image(rojo.image())
	}
	
	method cambiaAVerde(){
		self.image(verde.image())
	}
	
	method cambiaAAzul(){
		self.image(azul.image())
	}
}

class Kwid {
	var tanqueAdicional = false
	const property color = "Azul"
	
	method ponerTanque(){tanqueAdicional = true}
	method sacarTanque(){tanqueAdicional = false}
	method capacidad(){ return if(tanqueAdicional) 3 else 4 }
	method velMax() {return if(tanqueAdicional) 120 else 110}
	method peso() {return if(tanqueAdicional) 1350 else 1200}
}

object traffic {
	
	var property interior = null
	var property motor = null
	const property color = "Blanco"
	
	method capacidad() { return interior.capacidad() }
	method velMax(){ return motor.velMax() }
	method peso() { return 4000 + interior.peso() + motor.peso() }
}

object interiorComodo {

	method capacidad(){ return 5 }
	method peso(){ return 700 }
}

object interiorPopular {
	
	method capacidad(){ return 12 }
	method peso(){ return 1000 }
}

object motorPulenta{
	
	method velMax(){ return 130 }
	method peso(){ return 800 }
}

object motorBataton{
	
	method velMax(){ return 80 }
	method peso(){ return 500 }
}

class AutoEspecial {

	var property capacidad = null
	var property peso = null
	var property color = null
	var property velMax = null
	
}
