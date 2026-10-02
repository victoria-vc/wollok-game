import niveles.*
import fondos.*
import visuales.*

object juego {

    var opcionSeleccionada = 1
    var nivelActual = 1

    method iniciar() {
        self.mostrarMenu()
    }

    method mostrarMenu() {
        game.addVisual(fondoMenu)

  
        game.addVisual(botonEmpezar)
        game.addVisual(botonSalir)
        game.addVisual(flechaMenu)

        opcionSeleccionada = 1

        keyboard.up().onPressDo({
            self.arriba()
        })

        keyboard.down().onPressDo({
            self.abajo()
        })

        keyboard.enter().onPressDo({
            self.seleccionar()
        })
    }

    method arriba() {
        opcionSeleccionada = 1
        flechaMenu.moverArriba()
    }

    method abajo() {
        opcionSeleccionada = 2
        flechaMenu.moverAbajo()
    }

    method seleccionar() {
        if (opcionSeleccionada == 1) {
            self.iniciarNivel()
        }
    }

    method iniciarNivel() {
        game.clear()
        niveles.empezar(nivelActual)
        nivelActual += 1
    }
}


