require 'ruby2d'

class Graphics
    class Moon < Sprite
        def initialize
            super(
                './assets/moon.png',
                y: 80,
                height: 300 * 0.9,
                width: 300 * 0.9,
                x: -300*0.9,
                z: 9,
                opacity: 1,
            )
        end
    end
end