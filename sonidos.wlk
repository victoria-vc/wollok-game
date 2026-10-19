
import wollok.game.*

object sonidos {
  method sonidoAgarrarItem() {
    const audio = game.sound("agarrarItem.mp3")
    audio.volume(0.5)
    audio.play()
  }

  method choque() {
    const audio = game.sound("choque.mp3")
    audio.volume(0.1)
    audio.play()
  }

  method moverPersonaje() {
    const audio = game.sound("movimiento.mp3")
    audio.volume(0.1)
    audio.play()
  }

  method pasarNivel() {
    game.sound("pasarNivel.mp3").play()
  }

  method ganarVida() {
    game.sound("salud.mp3").play()
  }

  method gameOver() {
    game.sound("gameOver.mp3").play()
  }
}
