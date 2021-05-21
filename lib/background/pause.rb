require 'ruby2d'

class Graphics
    class Pause < Rectangle
        def initialize
            super(
                x: 0,
                y: 0,
                color: [0,0,0,0.5],
                width: Window.width,
                height: Window.height,
                z:20,
            )            
        end
    end
end