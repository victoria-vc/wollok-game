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
}

class BloquePasto {
    var property position
    method image() = "pasto.png"
}

class NivelUnoCartel {
    var property position
    method image() = "nivel1.png"
}