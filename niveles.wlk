//import juego.*
import jugador.*
import enemigos.*
import movimientos.*
import fondos.*
import visuales.*
import powerups.*

object generadorDeNivel {

    method generarFilas() {
        const filas = []
        var calleSeguidas = 0
        var pastoSeguidas = 0

        (0 .. game.height() - 1).forEach({ y =>
            const esBorde = y == 0 or y == game.height() - 1
            var esCalle = false

            if (!esBorde) {
                if (calleSeguidas >= 2) {
                    esCalle = false
                } else if (pastoSeguidas >= 2) {
                    esCalle = true
                } else {
                    esCalle = 0.randomUpTo(1) > 0.5
                }
            }

            if (esCalle) {
                calleSeguidas += 1
                pastoSeguidas = 0
            } else {
                pastoSeguidas += 1
                calleSeguidas = 0
            }

            filas.add(esCalle)
        })
        return filas   // lista de booleanos: true = calle, false = pasto

    }

}
class Nivel {
	const filasPasto = []
	const callesConAutos = new Dictionary()
	const property ticksGeneracion
	const enemigos = []
/* 
	method Visuales() {
	} */
	
	method empezar() {

		

		const filas = generadorDeNivel.generarFilas();

		(0 .. filas.size() - 1).forEach({ y =>
            const esCalle = filas.get(y)

            (0 .. game.width() - 1).forEach({ x =>
                if (esCalle) {
                    game.addVisual(new BloqueCalle(position = game.at(x, y)))
					//filasCalle.add(y)
					callesConAutos.put(y, 0)
                } else {
                    game.addVisual(new BloquePasto(position = game.at(x, y)))
					filasPasto.add(y)
                }
            })
		})

		game.onTick(ticksGeneracion, "generar_enemigos", {
			
			callesConAutos.forEach({calle, cantidadAutos => 
				//console.println("calle " + calle.toString() + " autos" + cantidadAutos.toString())
				if (cantidadAutos == 0 and 0.randomUpTo(1) > 0.5) {
					const ladoRandom = 0.randomUpTo(1)
					var lado
					var direccion
					if (ladoRandom > 0.1 ){
						lado = 0
						direccion = 1
					}else{
						lado = game.width()
						direccion = -1
					}
					const nuevoAuto = new Auto(position = game.at(lado, calle), velocidad = 0.1.randomUpTo(1), direccion = direccion, color=["rojo", "azul", "gris"].anyOne())
					enemigos.add(nuevoAuto)
					//callesConAutos.put(calle, 1)
					game.addVisual(nuevoAuto)
				}
			})

		})

		game.onTick(100, "sacar_autos", {
			const autosAfuera = enemigos.filter({auto => auto.estaAfuera()})
			autosAfuera.forEach({auto => game.removeVisual(auto)})
			enemigos.removeAll(autosAfuera)
		})

		game.onTick(50, "movimiento_autos", {
			enemigos.forEach({auto => auto.mover()})
		})


		game.addVisual(jugador)
        movimientos.configControles(jugador)
		game.addVisual(marcadorVidas)
		game.addVisual(new NivelUnoCartel(position = game.at(0, 0)))

		const mate1 = new Mate(position = game.at(0, 3))
		const mate2 = new Mate(position = game.at(12, 7))

		game.addVisual(mate1)
		game.addVisual(mate2)
		game.onCollideDo(jugador, { elemento => 
    		if(elemento.className().contains("enemigo")){
        		jugador.perderVida()
			}
		})	
	
	}
	
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


object niveles{


	const nivel1 = new Nivel(ticksGeneracion = 1000)
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