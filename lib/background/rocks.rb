require 'ruby2d'

class Graphics
    class Rocks < Sprite
        def initialize
            super(
                './assets/rocks_1_3x.png',
                x: 0,
                y: -250,
                height: Window.height,
                clip_height: 1080,
                z: 2,
            )
        end
    end
end