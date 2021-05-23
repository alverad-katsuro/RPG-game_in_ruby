require 'ruby2d'

class Graphics
    class Tela < Rectangle
        def initialize
            super(
                x: 0,
                y: 0,
                width: Window.width,
                height: Window.height,
                z:8,
                color: [0,0,0,0.7], 
            )            
        end
    end
end