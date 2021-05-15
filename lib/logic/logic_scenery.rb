class Logic
    class Scenery
        attr_reader :sky, :sun, :road, :rocks, :mountain_close
        def initialize sun:, road:, rocks:, mountain_close:, sky:
            @sky = sky
            @sun = sun
            @road = road
            @rocks = rocks
            @mountain_close = mountain_close
        end

        def moviment_scenery(direction_now)
            case direction_now
            when :rigth
              @mountain_close.x += -0.4
              @rocks.x += -0.1
              @sun.x += -0.2
              @road.x += -0.2
              @sun.y += -0.08
            when :left
              if @mountain_close.x <= 0
                @mountain_close.x += 0.4
                @road.x += 0.2
                @rocks.x += 0.1
              end
            end
        end
    end
end