require 'ruby2d'

class Graphics
    class Road < Sprite
        def initialize
            super(
                './assets/road.png',
                x: 0,
                y: Window.height * 0.60,
                height: 590,
                clip_height: height,
                clip_y: 490,
                z: 4,
            )
        end
    end
end