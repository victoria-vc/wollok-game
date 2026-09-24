import niveles.*


object jugador {
    var property position = game.center()
    var direccion = "derecha"

    method image() {
        var asset
        if (direccion == "derecha")
            asset = "derecha.png" 
        if (direccion == "izquierda")
            asset = "izquierda.png"
        if (direccion == "arriba")
            asset = "arriba.png"
        if (direccion == "abajo")
            asset = "abajo.png"
        return asset
    }

    method position(nuevaPosition) {
        if (nuevaPosition.x() > position.x())
            direccion = "derecha"

        if (nuevaPosition.x() < position.x())
            direccion = "izquierda"
        
        if (nuevaPosition.y() > position.y())
            direccion = "arriba"

        if (nuevaPosition.y() < position.y())
            direccion = "abajo"

        position = nuevaPosition
    }
}