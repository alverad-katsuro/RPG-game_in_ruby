class Logic
    class Player
        attr_reader :objects

        def initialize
            @objects = {}
        end
        
        def add(key:, value:)
            @objects[key] = value
        end 

        def reload!
            @objects[:animation].x = (Window.width) * 0.1
            @objects[:animation].y = (Window.height) * 0.6
            stop_hero_animation
            revive!
        end

        def shadow_location
            @objects[:shadow].x = @objects[:animation].x + @objects[:animation].width / 2.8
            @objects[:shadow].y = @objects[:animation].y + @objects[:animation].height * 0.738
        end

        ##### CONTADOR do TEMPO DE ATTACK
        def atack
            if @objects[:stats_basic].action_now == :attacking && ((Time.now - @objects[:stats_basic].time_attack) > 0.5)
                @objects[:stats_basic].time_attack = 0
                @objects[:stats_basic].action_now = :none
                stop_hero_animation()
            end
        end
        #### FIM ####

        ##### CONTADOR do TEMPO DA DEFESA
        def defend
            if @objects[:stats_basic].action_now == :defend && ((Time.now - @objects[:stats_basic].time_defend) > 1)
                @objects[:stats_basic].time_defend = 0
                @objects[:stats_basic].action_now = :none
                stop_hero_animation()
            end
        end
        #### FIM ####

        ##### DEFINE A DIRECAO DO HEROI
        def direction (direction:)
            @objects[:stats_basic].direction_now = direction
        end
        #### FIM ####

        ##### DEFINE A ACAO ATUAL
        def action (action:)
            @objects[:stats_basic].action_now = action
        end
        #### FIM ####

        ##### ADICIONA OS COMPONENTES DO JOGADOR #####
        def add_modulos modulos:
            modulos.each do |modulo|
                extend modulo
            end
        end
        #### FIM ####
    end
end