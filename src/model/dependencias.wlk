class Dependencia {

	const rodados = []	
	var property cantEmpleados = 0
	const registroPedidos = []
	
	method agregarAFlota(rodado){
		rodados.add(rodado)
	}
	
	method quitarDeFlota(rodado){
		rodados.remove(rodado)
	}
	
	method pesoTotalFlota(){
		return rodados.sum({ flota => flota.peso() })
	}
	
	method estaBienEquipada(){
		return rodados.size() >= 3 and rodados.all({flota => flota.velMax() >= 100})
	}
	
	method  capacidadTotalEnColor(color) {
		return rodados.filter({ flota => flota.color() == color}).sum({ flota => flota.capacidad() }) 
	}
	
	method colorDelRodadoMasRapido() {
		return rodados.max({ flota => flota.velMax()}).color()
	}
	
	method capacidadFaltante() {
		return cantEmpleados - rodados.sum({ flota => flota.capacidad() })
	}
	
	method esGrande() {
		return cantEmpleados >= 40 and rodados.size() >= 5
	}
	
	method agregarPedido(unPedido){
		registroPedidos.add(unPedido)
	}
	
	method quitarPedido(unPedido){
		if (registroPedidos.any({ pedido => pedido == unPedido})){
			registroPedidos.remove(unPedido)
		}
	}
	
	method totalPasajerosEnPedidos(){
		return registroPedidos.sum({pedido => pedido.cantPasajeros()})
	}
	
	method pedidosNoSatisfechos() {
		return registroPedidos.map({ pedido => self.puedeSatisfacerPedido(pedido)})
	}
	
	method puedeSatisfacerPedido(pedido) {
		return rodados.any({veh => pedido.puedeSatisfacerViaje(veh)})
		
	}
	
	method coloresIncompatiblesEnPedidos(color){
		return registroPedidos.all({
			pedido => pedido.coloresIncompatibles().any({ colores => colores == color })
		})
	}
	
	method relajarTodosLosPedidos(){
   		registroPedidos.forEach({ pedido =>  pedido.relajar()})
   	}
}
