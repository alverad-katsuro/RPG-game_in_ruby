class Logic
    module Heath    
        ##### vida do jogador
        def life_down
            down = -rand(5..10)
            @stats_basic.life += down
        end

        ##### verifica se ele o nb morreu
        def hero_alive?
            if life <= 0
                @animation_characters.remove
                @stats_basic.deaths += -1
                false
            else
                true
            end
        end
        
        #### revive
        def revive?
            @animation_characters.add
            @stats_basic.life = 100
        end
    end
end