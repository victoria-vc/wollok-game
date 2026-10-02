//import juego.*
import jugador.*
import enemigos.*
import movimientos.*
import fondos.*

class Nivel {
/* 
	method Visuales() {
	} */
	
	method empezar(){}
	
	/*
	method jugarNivel() {
		game.clear() // con esto se borra TODO del tablero
	}

	method perderNivel() {
	}

	method reiniciarJuego() {   
	}
	

	method pasarDeNivel() {
	} */

}

 object  nivel1{ // inherits para heredar varriables y métodos de Nivel()

	method empezar(){
		console.println("Nivel 1 empezando")
		game.addVisual(fondoCalle)

		game.addVisual(jugador)

		movimientos.configControles(jugador)
	} // override para agarrar método heredado pero cambiar su comportamiento
}

object niveles{

	var property nivelesCreados = [nivel1]

	method empezar(nivel){
		nivelesCreados.get(nivel - 1).empezar()
	}
}

/*
object nivel2 Nivel(){}
object nivel3 Nivel(){}
object nivel4 Nivel(){}
object nivel5 Nivel(){} */