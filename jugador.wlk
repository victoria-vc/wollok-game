import niveles.*


object jugador {
    var property position = game.at(10, 0)
    var direccion = "derecha"
    var property vidas = 3 

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
        const temp = position
        console.println(self.estaEnGrilla(nuevaPosition).toString())
        if ( self.estaEnGrilla(nuevaPosition)){
            if (nuevaPosition.x() > position.x())
                direccion = "derecha"

            if (nuevaPosition.x() < position.x())
                direccion = "izquierda"
            
            if (nuevaPosition.y() > position.y())
                direccion = "arriba"

            if (nuevaPosition.y() < position.y())
                direccion = "abajo"

            position = nuevaPosition
        }else{
            position = temp
        }
    }

    method perderVida() {
        vidas = vidas - 1
        //sonido de perder vida
        position = game.at(10, 0)
        if(self.perdio()){
            "true"
        }else{
            "false"
        }
    }

    method estaEnGrilla(pos) = pos.x() >= 0 and pos.x() <= game.width() - 1 and pos.y() >= 0 and pos.y() <= game.height() - 1

    method perdio() = vidas < 1 //sonido de game over

    method sumarVida(){
        vidas += 1
        //sonido de vida nueva
    }

}