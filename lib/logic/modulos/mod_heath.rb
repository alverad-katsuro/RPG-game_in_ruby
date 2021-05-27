class Logic
    module Heath    
        ##### vida do jogador
        def life_down
            down = -rand(5..10)
            @objects[:stats_basic].life += down
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
        end

    end
end