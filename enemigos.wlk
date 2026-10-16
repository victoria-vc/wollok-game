import niveles.*


class Enemigo {
    var property position
    var property direccion
    var property velocidad

    method esEnemigo() = true
    method esPowerUp() = false

    method mover(){
        position = position.right(direccion * velocidad)
    }

    method estaAfuera() = self.position().x() < -5 or self.position().x() > game.width() + 5 //agrego 5 a los dos lados para que no se borren antes de aparecer
}

class Auto inherits Enemigo{
    var property color
    method image() = "auto_" + color.toString() + ".png" 
    
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