class Logic
    module Heath    
        ##### vida do jogador
        def life_down
            down = -rand(5..10)
            @objects[:stats_basic].life += down
            corazon_down
        end

        

        ##### verifica se ele o nb morreu
        def hero_alive?
            if @objects[:stats_basic].life <= 0 && @objects[:stats_basic].vivo
                death_animation()
                @objects[:stats_basic].deaths += +1
                @objects[:stats_basic].vivo = false
                @objects[:corazon].remove
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
        end

        private
        def corazon_down
            @objects[:corazon].width = @objects[:corazon].width_base * @objects[:stats_basic].life / 100
            @objects[:corazon].clip_width = @objects[:corazon].width_base * @objects[:stats_basic].life / 100
        end
    end
end