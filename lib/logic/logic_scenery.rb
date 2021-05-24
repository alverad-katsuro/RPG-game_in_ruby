class Logic
    class Scenery
        attr_reader :objects

        def initialize
            @objects = {time:Time.now}
        end

        def update!
            mov_nuvem!
            reload_clouds!
            horarios
        end

        def add(key, graphic)
            @objects[key] = graphic
        end

        private 

        def time_now
            Time.now - @objects[:time]
        end

        def horarios
            if (Time.now - @objects[:time]) <= 30
                swuit_backgroud fator: -1
            elsif ((Time.now) - @objects[:time]) > 30 && ((Time.now) - (@objects[:time]))<= 150
                amanhecer!
            elsif (Time.now - @objects[:time]) > 150
                anoitecer
                if (Time.now - @objects[:time]) >=195
                    moviment_moon
                    nuvem_opacity opacity: 1
                    swuit_backgroud fator: -1 unless Time.now - @objects[:time] < 285
                    (reload_clock; reload_moon_and_sun!) unless (Time.now - @objects[:time]) < 295
                end
            end
        end

        def amanhecer!
            moviment_sun
            escurecer?(fator: -1)
        end

        def escurecer?(fator:1) ### 1 - escurece, -1 = amanhece
            case fator
            when 1
                if @objects[:tela].opacity != 0.7
                    @objects[:tela].opacity += 0.00040
                    @objects[:tela].opacity = 0.7 unless @objects[:tela].opacity <= 0.7
                end
            when -1
                if @objects[:tela].opacity != 0
                    @objects[:tela].opacity += -0.00040
                    @objects[:tela].opacity = 0 unless @objects[:tela].opacity >= 0
                end
            end
        end

        def anoitecer
            if @objects[:sun].y + @objects[:sun].height < 0
                escurecer?
                swuit_backgroud
            end
            if @objects[:sun].y < 0 && (@objects[:moon].y + 100) > 0
                moviment_moon
                @objects[:moon].opacity = 1
                escurecer? fator: 1
                nuvem_opacity opacity: -1
            end
        end

        def swuit_backgroud(fator: 1)
            @objects[:sky].color.a += -0.0006 * fator
            @objects[:sky_night].color.a += +0.0006 * fator
        end

        def moviment_sun
            @objects[:sun].x += 0.2
            @objects[:sun].y += -0.075
            @objects[:sun].rotate += 0.05          
        end

        def moviment_moon
            @objects[:moon].x += 0.1
            @objects[:moon].y += -0.04
            @objects[:moon].rotate += 0.05          
        end

        def mov_nuvem!
            @objects[:clouds_big].clip_x += -0.7
            @objects[:clouds_med].clip_x += 0.6
            @objects[:cloud_small].clip_x += 0.9
        end

        def nuvem_opacity(opacity:)
            if (@objects[:clouds_big].opacity) >= 0 && (@objects[:clouds_big].opacity) <= 0.5
                @objects[:clouds_big].color.a += 0.002 * opacity
                @objects[:clouds_med].color.a += 0.002 * opacity
                @objects[:cloud_small].color.a += 0.002 * opacity
            end
        end

        def reload_moon_and_sun!
            @objects[:sun].x = 15
            @objects[:sun].y = 200
            @objects[:moon].x = - @objects[:moon].width
            @objects[:moon].y = 80
        end

        def reload_clock
            @objects[:time] = Time.now
        end
       
        def reload_clouds!
            if @objects[:clouds_big].clip_x == (@objects[:clouds_big].clip_width)
                @objects[:clouds_big].clip_x = 3840
            end
            if @objects[:clouds_med].clip_x == (@objects[:clouds_med].clip_width)
                @objects[:clouds_med].clip_x = 0
            end
            if @objects[:clouds_big].clip_x == (@objects[:clouds_big].clip_width)
                @objects[:cloud_small].clip_x = 0
            end
        end
    end
end