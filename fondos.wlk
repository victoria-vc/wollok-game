import niveles.*


class Fondo {
    var property position = game.at(0, 0)
    method image() 
}

object fondoMenu inherits Fondo {
    override method image() = "menu.png"
}

object fondoCalle inherits Fondo {
    override method image() = "calle.png"
}