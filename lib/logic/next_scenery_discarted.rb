def next_scenery?
    puts "#{@hero.clip_x} #{@scenery.road.clip_width} #{}"
    if @hero.clip_x <= @scenery.road.clip_width
        @scenery.moviment_scenery(direction_now: @direction_now, speed: @speed)
    end
end

        ##### PROXIMO CENARIO
        def att_scenery
            if (@hero.x >= Window.width * 0.9) && (@scenery.road.x * - 1 <= @scenery.road.clip_width * 2/3)
                @hero.x = 0
                @scenery.next_scenery direction: :right
            end
            if (@hero.x <= -50) && (@scenery.road.x) * -1 >= Window.width
                @hero.x = Window.width * 0.87
                @scenery.next_scenery direction: :left
            end
        end

        ####
        def next_scenery direction:
			case direction
			when :right
				moviment_scenery(direction_now: :right, speed: Window.width)
			when :left
				moviment_scenery(direction_now: :left, speed: Window.width)
			end
		end

        def moviment_scenery(direction_now:, speed:)
            speed = speed * 1.4
			case direction_now
            when :right
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