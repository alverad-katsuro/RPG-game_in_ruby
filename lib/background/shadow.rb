require 'ruby2d'

class Graphics
    class Shadow < Sprite
        def initialize
            super(
                './assets/shadow.png',
                x: 0,
                y: 0,
                height: 12  * (Window.height * 0.0015),
                width: 46  * (Window.height * 0.0015),
                color: [0.5,0.5,0.5,0.6],
                z: 5,
            )
        end
    end
end