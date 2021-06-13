class Logic
    module Heath    
        ##### vida do jogador
        def life_down
            down = -rand(5.0..10.0)
            @objects[:stats_basic].life += down
            @objects[:stats_basic].speed += down / 50
            corazon_down
        end

        ##### verifica se ele o nb morreu
        def hero_alive?
            if @objects[:stats_basic].life <= 0 && @objects[:stats_basic].vivo
                death_animation()
                @objects[:stats_basic].deaths += +1
                @objects[:stats_basic].vivo = false
                false
            end
            true
        end

        #### revive
        def revive!
            @objects[:stats_basic].life = 100
            @objects[:stats_basic].vivo = true
            @objects[:corazon].width = 222
            @objects[:corazon].clip_width = 222
            @objects[:corazon].add
            @objects[:stats_basic].speed = 5
        end

        private
        def corazon_down
            @objects[:corazon].width = @objects[:corazon].width_base * @objects[:stats_basic].life / 100
            @objects[:corazon].clip_width = @objects[:corazon].width_base * @objects[:stats_basic].life / 100
            puts "wid #{@objects[:corazon].width}, clip #{@objects[:corazon].clip_width}"
            @objects[:corazon].remove unless @objects[:corazon].width > 0 && @objects[:corazon].clip_width > 0
        end
    end
end