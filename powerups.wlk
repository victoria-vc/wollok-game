import niveles.*


class PowerUp {
    var property position
    
    method esPowerUp() = true
}

class Mate inherits PowerUp {
    method image() = "mate.png"
}