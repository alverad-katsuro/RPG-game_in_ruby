require 'ruby2d'

class Graphics
    class Sky_Night < Sprite
        def initialize
            super(
                './assets/sky_night.png',
                x: 0,
                y: 0,
                height: Window.height,
                clip_height: 1080,
                z: 0,
                opacity: 0,
            )
        end
    end
end