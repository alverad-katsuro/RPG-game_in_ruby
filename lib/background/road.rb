require 'ruby2d'

class Graphics
    class Road < Sprite
        def initialize
            super(
                './assets/road.png',
                x: 0,
                y: Window.height * 0.60,
                height: Window.height * 0.4,
                clip_height: 500,
                clip_y: 500,
                z: 4,
            )
        end
    end
end
