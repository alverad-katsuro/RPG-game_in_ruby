require 'ruby2d'

class Graphics
    class Dialogo < Text
        def initialize (text:, font_size: 25, color: 'blue')
            super(
                text,
                x: 0, y: 0,
                font: './assets/font/Pattaya-Regular.ttf',
                #height: 300, width: 300,
                size: font_size,
                color: color,
                opacity: 1,
                #rotate: 90,
                z: 15,
            )
        end
    end
end