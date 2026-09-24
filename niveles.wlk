//import juego.*
import jugador.*
import enemigos.*

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

 object  nivel1 inherits Nivel(){ // inherits para heredar varriables y métodos de Nivel()

   override method empezar(){} // override para agarrar método heredado pero cambiar su comportamiento
}

/*
object nivel2 Nivel(){}
object nivel3 Nivel(){}
object nivel4 Nivel(){}
object nivel5 Nivel(){} */