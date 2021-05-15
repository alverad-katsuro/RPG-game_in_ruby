require 'ruby2d'

class Graphics
    class Sun < Sprite
        def initialize
            super(
                './assets/sun.png',
                x: 0,
                y: 0,
                height: Window.height,
                clip_height: 1080,
                z: 1,
            )
        end
    end
end