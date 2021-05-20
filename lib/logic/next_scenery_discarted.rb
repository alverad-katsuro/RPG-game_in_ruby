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
                @scenery.next_scenery direction: :rigth
            end
            if (@hero.x <= -50) && (@scenery.road.x) * -1 >= Window.width
                @hero.x = Window.width * 0.87
                @scenery.next_scenery direction: :left
            end
        end