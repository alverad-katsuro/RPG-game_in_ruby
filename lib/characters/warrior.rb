require 'ruby2d'

class Graphics
    class Hero < Sprite
      attr_accessor :time_attack
      attr_reader :direction_now, :action_now, :attacking
      def initialize
        super(
            './assets/tudo_165_165.png',
            width: 165,
            height: 165,
            x: (Window.width)/2-80,
            y: (Window.height)/2-50,
            time: 30,
            z: 5,
            animations: {
              walk_top: (create_movimente(qt_frames: 30, coluna: 0, linha: 2, width: 165, desloc_width: 1.5, height: 165)),
              walk_bottom: (create_movimente(qt_frames: 30, coluna: 0, linha: 8, width: 165, height: 165)),
              walk_left: (create_movimente(qt_frames: 30, coluna: 0, linha: 14, width: 165, height: 165)),
              walk_rigth: (create_movimente(qt_frames: 30, coluna: 0, linha: 21, width: 165, height: 165)),
              stop_top: (create_movimente(qt_frames: 30, coluna: 0, linha: 1, width: 165, desloc_width: 1.5, height: 165)),
              stop_bottom: (create_movimente(qt_frames: 30, coluna: 0, linha: 7, width: 165, height: 165)),
              stop_left: (create_movimente(qt_frames: 30, coluna: 0, linha: 13, width: 165, height: 165)),
              stop_rigth: (create_movimente(qt_frames: 30, coluna: 0, linha: 20, width: 165, height: 165)),
              attack_top: (create_movimente(qt_frames: 14, coluna: 0, linha: 3, width: 165, desloc_width: 1.5, height: 165)),
              attack_bottom: (create_movimente(qt_frames: 14, coluna: 0, linha: 9, width: 165, height: 165)),
              attack_left: (create_movimente(qt_frames: 14, coluna: 0, linha: 15, width: 165, height: 165)),
              attack_rigth: (create_movimente(qt_frames: 14, coluna: 0, linha: 16, width: 165, height: 165)),
            }
        )
        play(animation: :stop_bottom, loop: true)
        @direction_now = :bottom
        @action_now = :none
        @time_attack = Time.now
      end
      
      ##create_movimente - quantidade de frames, a coluna do frame, a linha do frame, a largura, o deslocamento relativo se houver erro na coordenada x, a altura do frame
      def create_movimente(qt_frames:0, coluna:0, linha:0, width:0, desloc_width:0, height:0)
        Array.new(qt_frames) {|range| {x: ((range + coluna) * width + 1 + desloc_width*range), y: (linha * height +1) , width: width, height: height}}
      end

      def direction (direction:)
        @direction_now = direction
      end

      def action (action:)
        @action_now = action
      end
            
      def atack
        if @action_now == :attacking && (Time.now - @time_attack > 0.5)
          @time_attack = 0
          @action_now = :none
        end
      end
    end
end

