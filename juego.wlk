import niveles.*


object juego {

    method iniciar(){

       // game.boardGround("fotoinicio.png")
       // musicaJuego.reproducir()

       self.iniciarNivel1()
    }

    method iniciarNivel1(){
      keyboard.space().onPressDo({nivel1.empezar()})
    }
}


