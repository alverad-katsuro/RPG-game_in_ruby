require 'ruby2d'

class Graphics
    class Cloud < Sprite
        def initialize
            super(
                './assets/rock_2_3x.png',
                x: 0,
                y: -250,
                height: Window.height,
                clip_height: 1080,
                z: 0,
            )
        end
    end
end