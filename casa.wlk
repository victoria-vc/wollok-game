import visuales.*

class NivelCasa {

    method empezar() {
        (0 .. game.height() - 1).forEach({ y =>
            (0 .. game.width() - 1).forEach({ x =>
                game.addVisual(self.bloqueEn(game.at(x, y)))
            })
        })
    }

    method bloqueEn(pos) {
        if (pos.y() == game.height() - 1) {
            return new BloqueCalle(position = pos)   // provisorio: pared de arriba
        }
        return new BloquePasto(position = pos)       // provisorio: piso
    }
}