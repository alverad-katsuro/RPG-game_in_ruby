require 'ruby2d'

class Graphics
    class Mountain_close < Sprite
        def initialize
            super(
                './assets/mountain.png',
                x: 0,
                y: 0,
                height: Window.height * 0.7,
                clip_height: 1080 - 290,
                clip_y: 290,
                z: 3,
            )
        end
    end
end