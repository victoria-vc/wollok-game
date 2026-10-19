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
	const filasCalle = []
	const enemigos = []

	const property ticksGeneracion
	const property probabilidadEnemigos
/* 
	method Visuales() {
	} */
	
	method generarEnemigo(lado, calle, direccion)

	method empezar() {

		const filas = generadorDeNivel.generarFilas();

		(0 .. filas.size() - 1).forEach({ y =>
            const esCalle = filas.get(y)
			if (esCalle) { filasCalle.add(y) } else { filasPasto.add(y) }
            (0 .. game.width() - 1).forEach({ x =>
                if (esCalle) {
                    game.addVisual(new BloqueCalle(position = game.at(x, y)))
                } else {
                    game.addVisual(new BloquePasto(position = game.at(x, y)))
                }
            })
		})

		game.onTick(ticksGeneracion, "generar_enemigos", {
			
			filasCalle.forEach({calle => 
				//console.println("calle " + calle.toString() + " autos" + cantidadAutos.toString())
				if (0.randomUpTo(1) < probabilidadEnemigos) {
					const ladoRandom = 0.randomUpTo(1)
					var lado
					var direccion
					if (ladoRandom > 0.5 ){
						lado = 0
						direccion = 1
					}else{
						lado = game.width()
						direccion = -1
					}
					const nuevoEnemigo = self.generarEnemigo(lado, calle, direccion)
					enemigos.add(nuevoEnemigo)
					//callesConAutos.put(calle, 1)
					nuevoEnemigo.agregarAlJuego()
				}
			})

		})

		game.onTick(100, "sacar_enemigos", { //saco de la visual y la lista los enemigos que estan fuera de la grilla
			const autosAfuera = enemigos.filter({enemigo => enemigo.estaAfuera()})
			autosAfuera.forEach({enemigo => enemigo.sacarDelJuego()})
			enemigos.removeAll(autosAfuera)
		})

		game.onTick(50, "movimiento_enemigos", {
			enemigos.forEach({enemigo => enemigo.mover()})
		})

		game.onTick(1000, "check_gano", {
			self.pasarDeNivel()
		})


		

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
	
 */
	method pasarDeNivel() {
		//jugador.puedePasarDeNivel()
		if(jugador.estaEnFacultad()){
			jugador.reiniciarPosicion()
			niveles.pasarNivel()
		}
	}

}

class Nivel1 inherits Nivel{

	override method generarEnemigo(lado, calle, direccion){
		return new Auto(position = game.at(lado, calle), velocidad = 0.1.randomUpTo(1), direccion = direccion, color=["rojo", "azul", "gris"].anyOne())
	}
}

class Nivel2 inherits Nivel{
		override method generarEnemigo(lado, calle, direccion){
			return new Colectivo(position = game.at(lado, calle), velocidad = 0.2.randomUpTo(1.5), direccion = direccion)
		}
}

object niveles{

	var property nivelActual = 0

	const nivel1 = new Nivel1(ticksGeneracion = 1000, probabilidadEnemigos = 0.2)
	const nivel2 = new Nivel2(ticksGeneracion = 800, probabilidadEnemigos = 0.4)

	var property nivelesCreados = [nivel1, nivel2]

	method cargarVisuales(){
		game.addVisual(jugador)
        movimientos.configControles(jugador)
		game.addVisual(marcadorVidas)
		game.addVisual(new NivelCartel(position = game.at(0, 0), nivel = nivelActual + 1))
	}

	method empezar(){
		nivelesCreados.get(0).empezar()
		self.cargarVisuales()
	}

	method pasarNivel(){
		nivelActual += 1
		game.clear()
		if(nivelActual < nivelesCreados.size()){
			nivelesCreados.get(nivelActual).empezar()
		}else{
			console.println("Ganaste")
		}
		self.cargarVisuales()
	}

}

/*
object nivel2 Nivel(){}
object nivel3 Nivel(){}
object nivel4 Nivel(){}
object nivel5 Nivel(){} */