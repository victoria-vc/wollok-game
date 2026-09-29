import niveles.*

object juego {

    var opcionSeleccionada = 1
    var nivelActual = 1

    method iniciar() {
        self.mostrarMenu()
    }

    method mostrarMenu() {
        game.boardGround("menu.png")

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
        game.boardGround("calle.png")
        niveles.empezar(nivelActual)
        nivelActual += 1
    }
}


object botonEmpezar {

    var property position = game.at(4, 5)

    method image() = "empezar.png"
}


object botonSalir {

    var property position = game.at(4, 3)

    method image() = "salir.png"
}


object flechaMenu {

    var property position = game.at(2, 5)

    method image() = "flecha.png"

    method moverArriba(){
        position = game.at(2, 5)
    }

    method moverAbajo(){
        position = game.at(2, 3)
    }
}