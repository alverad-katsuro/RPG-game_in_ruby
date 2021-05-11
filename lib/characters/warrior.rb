require 'ruby2d'

class Graphics
  class Hero < Sprite
    attr_reader :direction_now, :action_now
    def initialize
      super(
          './assets/tudo_165_165.png',
          width: 165,
          height: 165,
          clip_width: 165,
          x: (Window.width)/2-80,
          y: (Window.height)/2-50,
          clip_height: 165,
          time: 30,
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
      @direction_now = :bottom
      @action_now = :none
      play(animation: :stop_bottom, loop: true)
    end

    def create_movimente(qt_frames:0, coluna:0, linha:0, width:0, desloc_width:0, height:0)
      Array.new(qt_frames) {|range| {x: ((range + coluna) * width + 1 + desloc_width*range), y: (linha * height +1) , width: width, height: height}}
    end

    def direction (direction:)
      @direction_now = direction
    end

    def action (action:)
      @action_now = action
    end

    #def update!(logic)
    #  self.x = logic.x
    #  self.y = logic.y
    #end
  end
end