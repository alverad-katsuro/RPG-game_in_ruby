require 'ruby2d'

class Graphics
    class Rocks < Sprite
        def initialize
            super(
                './assets/rocks.png',
                x: 0,
                y: 50,
                height: Window.height * 0.6,
                clip_height: 1080-430,
                clip_y: 430,
                z: 2,
            )
        end
    end
end