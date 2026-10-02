//import juego.*
import jugador.*
import enemigos.*
import movimientos.*
import fondos.*
import visuales.*

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

object nivel1 {

    method empezar() {
        game.ground("pasto.png")
        const filasDeCalle = [2, 4, 6, 8, 10, 12] // filas donde hay calle

        filasDeCalle.forEach({ filaY => 
            (0 .. game.width() - 1).forEach({ columnaX =>
                game.addVisual(new BloqueCalle(position = game.at(columnaX, filaY)))
            })
        })

        game.addVisual(jugador)
        movimientos.configControles(jugador)
    } 
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