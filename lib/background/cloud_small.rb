require 'ruby2d'

class Graphics
    class CloudSmall < Sprite
        def initialize
            super(
                './assets/cloud_small.png',
                x: 0,
                y: 0,
                opacity: 0.5,
                height: Window.height,
                width: Window.width,
                clip_x: 0,
                clip_width: 1920,
                z: 5,
            )
        end
    end
end