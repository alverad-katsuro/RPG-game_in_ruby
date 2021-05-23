require 'ruby2d'

class Graphics
    class Moon < Sprite
        def initialize
            super(
                './assets/moon.png',
                x: 80,
                y: 150,
                height: 300 * 0.9,
                width: 300 * 0.9,
                z: 100,
            )
        end
    end
end