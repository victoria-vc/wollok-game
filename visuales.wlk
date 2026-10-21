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

object marcadorVidas {
       var property position = game.at(1, 13)

       method text() = "Vidas: " + jugador.vidas()
       method textColor() = "FFFFFF"
   }

object flechaIndicadora {
    var property position = game.at(19, 13)
    method image() = "flechaRoja.png"
}

class BloquesFondo{
    method afectarJugador(unJugador) = null
}
class BloqueCalle inherits BloquesFondo{
    var property position
    method image() = "calle.png"

}

class BloquePasto inherits BloquesFondo{
    var property position
    method image() = "pasto.png"

}

class BloqueVia inherits BloquesFondo{
    var property position
    method image() = "via.png"
}

class NivelCartel inherits BloquesFondo{
    var property position
    var property nivel
    method image() = "nivel" + nivel.toString() + ".png"

}


object cartelPerdiste {
    var property position = game.at(7, 7)

    method text() = "PERDISTE"
    method textColor() = "FF0000"

    method afectarJugador(unJugador) {}
}
