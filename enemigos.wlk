import niveles.*


class Enemigo{
    var property position
    var direccion = 1
    var property velocidad

    method image() = "bolita.png"

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