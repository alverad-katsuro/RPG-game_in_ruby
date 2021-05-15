require 'ruby2d'

class Graphics
    class Sky < Sprite
        def initialize
            super(
                './assets/sky.png',
                x: 0,
                y: -250,
                height: Window.height,
                clip_height: 1080,
                z: 0,
            )
        end
    end
end