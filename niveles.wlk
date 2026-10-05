//import juego.*
import jugador.*
import enemigos.*
import movimientos.*
import fondos.*
import visuales.*
import powerups.*

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

       const filasDePasto = [0, 1, 3, 5, 7, 9, 11, 13, 14]
        
        filasDePasto.forEach({ filaY => 
            (0 .. game.width() - 1).forEach({ columnaX => 
                game.addVisual(new BloquePasto(position = game.at(columnaX, filaY)))
            })
        })
        const filasDeCalle = [2, 4, 6, 8, 10, 12] // filas donde hay calle

        filasDeCalle.forEach({ filaY => 
            (0 .. game.width() - 1).forEach({ columnaX =>
                game.addVisual(new BloqueCalle(position = game.at(columnaX, filaY)))
            })
        })

		game.addVisual(new NivelUnoCartel(position = game.at(0, 0)))

		const auto1 = new AutoRojo(position = game.at(19, 2), velocidad = 1, direccion = -1)
		const auto2 = new AutoAzul(position = game.at(0,4), velocidad = 1, direccion = 1)
		const auto3 = new AutoGris(position = game.at(19,6), velocidad = 1, direccion = -1)
		const auto4 = new AutoRojo(position = game.at(19, 8), velocidad = 1, direccion = -1)
		const auto5 = new AutoAzul(position = game.at(0, 10), velocidad = 1, direccion = 1)
		const auto6 = new AutoGris(position = game.at(19, 12), velocidad = 1, direccion = -1)

		game.addVisual(auto1)
		game.addVisual(auto2)
		game.addVisual(auto3)
		game.addVisual(auto4)
		game.addVisual(auto5)
		game.addVisual(auto6)

		game.onTick(200, "movimiento_autos", {
			auto1.mover()
			auto2.mover()
			auto3.mover()
			auto4.mover()
			auto5.mover()
			auto6.mover()
		})

		const mate1 = new Mate(position = game.at(0, 3))
		const mate2 = new Mate(position = game.at(12, 7))

		game.addVisual(mate1)
		game.addVisual(mate2)

        game.addVisual(jugador)
        movimientos.configControles(jugador)

		game.onCollideDo(jugador, { elemento => 
			if(elemento.esEnemigo()){
				jugador.position(game.at(10,0))
			}
		})
}}
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