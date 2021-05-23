require 'ruby2d'

class Graphics
    class CloudBig < Sprite
        def initialize
            super(
                './assets/clouds_big.png',
                x: 0,
                y: 0,
                height: Window.height,
                width: Window.width,
                clip_width: 1920,
                clip_x: 1920,
                a: 0.5,
                z: 1,
            )
        end
    end
end