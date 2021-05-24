require 'ruby2d'

class Graphics
    class Sun < Sprite
        def initialize
            super(
                './assets/sun.png',
                x: -560*0.5,
                y: 200,
                height: 560 * 0.5,
                width: 560 * 0.5,
                z: 1,
            )
        end
    end
end