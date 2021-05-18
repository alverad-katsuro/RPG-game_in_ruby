class Logic
    class Scenery
        attr_reader :sky, :sun, :road, :rocks, :mountain_close
        def initialize sun:, road:, rocks:, mountain_close:, sky:, ancoras:
            @sky = sky
            @sun = sun
            @road = road
            @rocks = rocks
            @mountain_close = mountain_close
			@ancora_left = ancoras[0]
			@ancora_rigth = ancoras[1]
        end

        def next_scenery direction:
			case direction
			when :rigth
				moviment_scenery(direction_now: :rigth, speed: Window.width)
			when :left
				moviment_scenery(direction_now: :left, speed: Window.width)
			end
		end

        def moviment_scenery(direction_now:, speed:)
            speed = speed * 1.4
			case direction_now
            when :rigth
				@mountain_close.x += -speed - 0.7
				@rocks.x += -speed - 0.3
				@road.x += -speed
				@sun.x += 0.002 * speed
				@sun.y += -0.09
            when :left
				@mountain_close.x += speed + 0.7
				@rocks.x += speed + 0.3
				@road.x += speed 
            end
        end
    end
end