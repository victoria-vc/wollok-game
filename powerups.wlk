import niveles.*


class PowerUp {
    var property position

    method image()
    
    method afectarJugador(unJugador) //falta implementar
}

class Mate inherits PowerUp {
    override method image() = "mate.png"
}