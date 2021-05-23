class Logic
    class Scenery
        attr_reader :objects

        def initialize
            @objects = {}
        end

        def add(key, graphic)
            @objects[key] = graphic
        end

        def manha!
            @objects[:tela].color = [0.259,0.255,0.28,0.7]  
        end

        def reload_cloud_med!
            if @objects[:clouds_med].clip_x == (@objects[:clouds_med].clip_width)
                @objects[:clouds_med].clip_x = 0
            end
        end 
        
        def reload_cloud_big!
            if @objects[:clouds_big].clip_x == (@objects[:clouds_big].clip_width)
                @objects[:clouds_big].clip_x = 3840
            end
        end

        def reload_cloud_small!
            if @objects[:clouds_big].clip_x == (@objects[:clouds_big].clip_width)
                @objects[:cloud_small].clip_x = 0
            end
        end

        def entardecer
            if @objects[:tela].color.a > 0
                @objects[:tela].color.a += -0.0004
                @objects[:sun].x += 0.1
                @objects[:sun].y += -0.15
            end
        end

        def mov_nuvem
            @objects[:clouds_big].clip_x += -0.7
            @objects[:clouds_med].clip_x += 0.6
            @objects[:cloud_small].clip_x += 0.9
        end

        def update!
            entardecer
            mov_nuvem
            reload_cloud_big!
            reload_cloud_med!
            reload_cloud_small!
        end
    end
end