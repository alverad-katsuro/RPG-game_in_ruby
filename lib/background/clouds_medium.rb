require 'ruby2d'

class Graphics
    class CloudMed < Sprite
        def initialize
            super(
                './assets/clouds_medium.png',
                x: 0,
                y: 0,
                height: Window.height,
                width: Window.width,
                clip_width: 1920,
                clip_x: 0,
                opacity: 0.5,
                z: 2,
            )
        end
    end
end