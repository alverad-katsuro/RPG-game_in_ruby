require 'ruby2d'

class Graphics
    class Ancora < Rectangle
        def initialize
            super(
                x: 0,
                y: Window.height * 0.5,
                width: 2,
                height: 10,
                z:20,
                color: 'teal'
            )            
        end
    end
end