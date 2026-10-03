import jugador.*
import niveles.*


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

class BloqueCalle {
    var property position
    method image() = "calle.png"
    method esEnemigo() = false
}

class BloquePasto {
    var property position
    method image() = "pasto.png"
    method esEnemigo() = false
}

class NivelUnoCartel {
    var property position
    method image() = "nivel1.png"
    method esEnemigo() = false
}

class NivelDosCartel {
    var property position
    method image() = "nivel2.png"
    method esEnemigo() = false
}

class NivelTresCartel {
    var property position
    method image() = "nivel3.png"
    method esEnemigo() = false
}

class NivelCuatroCartel {
    var property position
    method image() = "nivel4.png"
    method esEnemigo() = false
}

class NivelCincoCartel {
    var property position
    method image() = "nivel5.png" // ó "nivelfinal.png"
    method esEnemigo() = false
}