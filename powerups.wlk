import niveles.*
import sonidos.*


class PowerUp {
    var property position

    method image()
    
    method afectarJugador(unJugador)  {
        game.removeVisual(self)
    }
}

class Mate inherits PowerUp {
    override method image() = "powerups/mate.png"

    override method afectarJugador(unJugador) {
        super(unJugador)
        unJugador.sumarVida()
    }
}

class Escudo inherits PowerUp {
    var property tiempoMs = 6000
    override method image() = "powerups/escudo.png"

    override method afectarJugador(unJugador) {
        super(unJugador)
        unJugador.activarEscudo(tiempoMs)
        sonidos.agarrarItem()
    }
}