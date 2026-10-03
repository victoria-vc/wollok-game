import niveles.*


class Enemigo {
    var property position
    var direccion = 1
    var property velocidad

    method esEnemigo() = true

    method mover(){
        if (position.x() > game.width()){
            direccion = -1 * velocidad
        }
        if (position.x() < 0){
            direccion = 1 * velocidad
        }
        position = position.right(direccion)
    }
}

class AutoRojo inherits Enemigo {
    method image() = "autorojo.png"
}

class AutoAzul inherits Enemigo {
    method image() = "autoazul.png"
}

class AutoGris inherits Enemigo {
    method image() = "autogris.png"
}

/* class Bondi inherits Enemigo {
    method image() = "bondi.png"
}

class Tren inherits Enemigo {
    method image() = "tren.png"
}

class Piquete inherits Enemigo {
    method image() = "piquete.png"
} */

object barrera {
    var abierta = true
    var property position = game.at(1,1)

    method esEnemigo() = false

    method image(){
        if(abierta){
            return "abierta.png"
        }
        else{
            return "cerrada.png"
        }
    }

    method alternar(){
        abierta = !abierta
    }
}