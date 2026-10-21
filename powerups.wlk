import niveles.*
import sonidos.*


class PowerUp {
    var property position

    method image()
    
    method afectarJugador(unJugador) 
}

class Mate inherits PowerUp {
    override method image() = "mate.png"

    override method afectarJugador(unJugador) {
        unJugador.sumarVida()

    }
}

class Escudo inherits PowerUp {
    override method image() = "escudo.png"

    override method afectarJugador(unJugador) {
        unJugador.activarEscudo(8000)
        sonidos.agarrarItem()
    }
}