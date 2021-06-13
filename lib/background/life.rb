require 'ruby2d'

class Graphics
    class Corazon < Sprite
        attr_reader :width_base
        def initialize x_posi: 0.05
            @width_base = 222
            super(
                './assets/corazon.png',
                y: 80,
                height: 37,
                width: 222,
                clip_width: 222,
                x: Window.width * x_posi,
                z: 9,
            )
        end
    end
end