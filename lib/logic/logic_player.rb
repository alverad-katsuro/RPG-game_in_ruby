require 'forwardable'

class Logic
    class Player
        extend Forwardable
        attr_reader :animation_characters, :stats_basic

        delegate [:speed, :direction_now, :action_now, :time_attack, :deaths, :life, :vivo] => :@stats_basic
        delegate [:play, :x, :y] => :@animation_characters

        def add(animation_characters:nil, stats_basic:nil, key_map:nil, shadow:nil)
            @animation_characters = animation_characters unless animation_characters == nil
            @stats_basic = stats_basic unless stats_basic == nil
            @key_map = key_map unless key_map == nil
            @shadow = shadow unless shadow == nil
        end

        def shadow_location
            @shadow.x = @animation_characters.x + 58
            @shadow.y = @animation_characters.y + @animation_characters.height - 45
        end

        ##### CONTADOR do TEMPO DE ATTACK
        def atack
            if action_now == :attacking && ((Time.now - time_attack) > 0.5)
                @stats_basic.time_attack = 0
                @stats_basic.action_now = :none
                stop_hero_animation()
            end
        end
        #### FIM ####

        ##### DEFINE A DIRECAO DO HEROI
        def direction (direction:)
            @stats_basic.direction_now = direction
        end
        #### FIM ####

        ##### DEFINE A ACAO ATUAL
        def action (action:)
            @stats_basic.action_now = action
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


