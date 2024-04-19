object loboFeroz {
	var pesoLobo = 10
	
	method pesoLoboActual(){
		return 0.max(pesoLobo)
	}	
	method estaSaludable(){
		return pesoLobo.between(20,150)
	}
	method aumentarPeso(cantidad){
		pesoLobo = pesoLobo + cantidad
	}
	method disminuirPeso(cantidad){
		pesoLobo = pesoLobo - cantidad
	}	
	method aumentarPesoComiendo(cantidadComida){
		pesoLobo = pesoLobo + cantidadComida*0.1
	}
	method correr(){
		pesoLobo = pesoLobo - 1
	}
	method sufrirCrisis(){
		pesoLobo = 10
	}	
	method pesoLobo(numero){
		pesoLobo = numero
	}
}

object caperucitaRoja{
	var pesoCaperucita = 60
	var cantidadManzanas = 6
	
	method pesoCaperucitaTotal(){
		return pesoCaperucita + self.pesoCanasta()
	}	
	method pesoCanasta(){
		return cantidadManzanas*0.2
	}
	method cantidadManzanas(numero){
		cantidadManzanas = numero
	}
	
}

object abuelita{
	const pesoAbuelita = 50
	
	method pesoAbuelita(){
		return pesoAbuelita
	}
}

object cazador{
	var pesoCazador = 70
	
	method provocarCrisis(){
		loboFeroz.pesoLobo(10)		
	}
	method pesoCazador(){
		return pesoCazador
	}
}

//Representacion de Lobo Feroz: 
// loboFeroz.correr()
// loboFeroz.aumentarPesoComiendo(pesoAbuelita)
// caperucitaRoja.cantidadManzanas(5)
// loboFeroz.aumentarPesoComiendo(caperucitaRoja.pesoCaperucitaTotal())
// El lobo queda con peso = 20.1 


//Final: El lobo se come al cazador
//loboFeroz.aumentarPesoComiendo(cazador.pesoCazador())
//Peso final: 27.1

//Final: El cazador provoca una crisis en el lobo
// cazador.provocarCrisis())
//Peso final : 10

object chanchito{
	const pesoChanchito = 10
	method pesoChanchito(){
		return pesoChanchito
	}
}

object casaPaja{
	const resistencia = 0
	const ocupantes = 1
	method resistencia(){
		return resistencia
	}
	method pesoOcupantes(){
		return ocupantes*chanchito.pesoChanchito()
	}
	method pesoCasaPaja(){
		return self.pesoOcupantes() + resistencia
	}
}
// La casa de paja, de resistencia 0 y con el peso de un chanchito
// que equivale a 10, le resta 10 de peso al lobo feroz


object casaMadera{
	const resistencia = 5
	const ocupantes = 2

	method pesoOcupantes(){
		return ocupantes*chanchito.pesoChanchito()
	}
	method pesoCasaMadera(){
		return self.pesoOcupantes() + resistencia
	}
}
// La casa de madera, de resistencia 5 y con el peso de dos chanchitos
// que equivale a 20, le resta 25 de peso al lobo feroz


object casaLadrillo{
	var ladrillos = 5
	const ocupantes = 3
	
	method pesoOcupantes(){
		return ocupantes*chanchito.pesoChanchito()
	}
	method cantidadDeLadrillos(numero){
		ladrillos = numero
	}
	method pesoCasaLadrillo(){
		return self.pesoOcupantes() + self.resistencia()
	}
	method resistencia(){
		return 2 * ladrillos
	}
	method ladrillos(){
		return ladrillos
	}
}
// La casa de ladrillos, de resistencia que depende de la cantidad de
// ladrillos que tenga la casa sumado el peso de 3 chanchitos
// que equivalen a 30, le resta una cantidad de peso variable al lobo feroz


// Para tirar la casa de paja necesita 10 de peso, para tirar la casa de
//madera necesita 25 de peso adicionales y para tirar la de ladrillos voy
// a necesitar saber cuantos ladrillos tiene la casa.
// Imaginando el peso inicial del lobo feroz y la cantidad de ladrillos
// voy a saber si el lobo feroz come a los 3 chanchitos o no



//Escenario 1: El lobo feroz come a los 3 chanchitos

//loboFeroz.pesoLobo(100)
//loboFeroz.disminuirPeso(casaPaja.pesoCasaPaja())     Resto 10
//loboFeroz.disminuirPeso(casaMadera.pesoCasaMadera())   Resto 25
//casaLadrillo.cantidadDeLadrillos(10)
//loboFeroz.disminuirPeso(casaLadrillo.pesoCasaLadrillo()) Resto 50
//loboFeroz.aumentarPesoComiendo(3*chanchito.pesoChanchito()) aumenta 3 quedando en 18
// loboFeroz.pesoLoboActual() 18



//Escenario 2: El lobo feroz no se come a los chanchitos

// loboFeroz.pesoLobo(100)
//loboFeroz.disminuirPeso(casaPaja.pesoCasaPaja())     Resto 10
//loboFeroz.disminuirPeso(casaMadera.pesoCasaMadera())   Resto 25
//casaLadrillo.cantidadDeLadrillos(30)
//loboFeroz.disminuirPeso(casaLadrillo.pesoCasaLadrillo()) Resto 90
// loboFeroz.pesoLoboActual() 0  No le alcanzó al lobo feroz
