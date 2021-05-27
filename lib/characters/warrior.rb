require 'ruby2d'

class Graphics
    class Hero < Sprite
      def initialize
        super(
            './assets/tudo_165_165.png',
            width: 165 * (Window.height * 0.0015),
            height: 165 * (Window.height * 0.0015),
            x: (Window.width) * 0.1,
            y: (Window.height) * 0.6,
            time: 30,
            z: 7,
            animations: {
              walk_top: (create_movimente(qt_frames: 30, coluna: 0, linha: 2, width: 165, desloc_width: 1.5, height: 165)),
              walk_bottom: (create_movimente(qt_frames: 30, coluna: 0, linha: 8, width: 165, height: 165)),
              walk_left: (create_movimente(qt_frames: 30, coluna: 0, linha: 14, width: 165, height: 165)),
              walk_right: (create_movimente(qt_frames: 30, coluna: 0, linha: 21, width: 165, height: 165)),
              stop_top: (create_movimente(qt_frames: 30, coluna: 0, linha: 1, width: 165, desloc_width: 1.5, height: 165)),
              stop_bottom: (create_movimente(qt_frames: 30, coluna: 0, linha: 7, width: 165, height: 165)),
              stop_left: (create_movimente(qt_frames: 30, coluna: 0, linha: 13, width: 165, height: 165)),
              stop_right: (create_movimente(qt_frames: 30, coluna: 0, linha: 20, width: 165, height: 165)),
              attack_top: (create_movimente(qt_frames: 14, coluna: 0, linha: 3, width: 165, desloc_width: 1.5, height: 165)),
              attack_bottom: (create_movimente(qt_frames: 14, coluna: 0, linha: 9, width: 165, height: 165)),
              attack_left: (create_movimente(qt_frames: 14, coluna: 0, linha: 15, width: 165, height: 165)),
              attack_right: (create_movimente(qt_frames: 14, coluna: 0, linha: 16, width: 165, height: 165)),
              death_top: (create_movimente(qt_frames: 30, coluna: 0, linha: 0, width: 165, desloc_width: 1.5, height: 165)),
              death_bottom: (create_movimente(qt_frames: 30, coluna: 0, linha: 5, width: 165, height: 165)),
              death_left: (create_movimente(qt_frames: 30, coluna: 0, linha: 11, width: 165, height: 165)),
              death_right: (create_movimente(qt_frames: 30, coluna: 0, linha: 18, width: 165, height: 165)),
              hurt_top: (create_movimente(qt_frames: 14, coluna: 0, linha: 22, width: 165, height: 165)),
              hurt_bottom: (create_movimente(qt_frames: 14, coluna: 0, linha: 23, width: 165, height: 165)),
              hurt_left: (create_movimente(qt_frames: 14, coluna: 0, linha: 24, width: 165, height: 165)),
              hurt_right: (create_movimente(qt_frames: 14, coluna: 0, linha: 25, width: 165, height: 165)),
              defend_top: (create_movimente(qt_frames: 30, coluna: 0, linha: 26, width: 165, height: 165)),
              defend_bottom: (create_movimente(qt_frames: 30, coluna: 0, linha: 27, width: 165, height: 165)),
              defend_left: (create_movimente(qt_frames: 30, coluna: 0, linha: 28, width: 165, height: 165)),
              defend_right: (create_movimente(qt_frames: 30, coluna: 0, linha: 29, width: 165, height: 165))
            }
        )
        self.play(animation: :stop_bottom, loop: true)
      end
      
      ##create_movimente - quantidade de frames, a coluna do frame, a linha do frame, a largura, o deslocamento relativo se houver erro na coordenada x, a altura do frame
      def create_movimente(qt_frames: 0, coluna: 0, linha: 0, width: 0, desloc_width: 0, height: 0)
        Array.new(qt_frames) {|range| {x: ((range + coluna) * width + 1 + desloc_width*range), y: (linha * height +1) , width: width, height: height}}
      end

      def localiza_frame(qt_frames: 0, x_inicial: 0, y_inicial: 0, coluna: 0, width: 0, desloc_width: 0, height: 0)
        Array.new(qt_frames) {|range| {x: ((range + coluna) * width + 1 + desloc_width*range), y: y_inicial, width: width, height: height}}
      end
    end
end

