import jugador.*
import enemigos.*


object movimientos {

    method configControles(jugador) {

        keyboard.up().onPressDo({ jugador.position(jugador.position().up(1)) })
        keyboard.down().onPressDo({ jugador.position(jugador.position().down(1)) })
        keyboard.left().onPressDo({ jugador.position(jugador.position().left(1)) })
        keyboard.right().onPressDo({ jugador.position(jugador.position().right(1)) })
    }
}
