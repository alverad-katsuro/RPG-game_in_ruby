class Logic
    class Hero
        attr_accessor :time_attack, :speed
        attr_reader :direction_now, :action_now, :hero
        def initialize hero:, scenery:, speed:1.5*10
            @hero = hero
            @speed = speed
            @scenery = scenery
            @direction_now = :bottom
            @action_now = :none
            @time_attack = Time.now
        end

        #### Modifica a coordenada y do heroi
        def hero_y_modi (vertical:, dash: 1.0)
            if vertical == :top
                if (@hero.y) >= Window.height*0.6
                    @hero.y += @speed * dash
                end
            end
            if vertical == :bottom
                if @hero.y <= (Window.height) -150
                    @hero.y += @speed * dash
                end
            end
        end
    
        #### Modifica a coordenada x do heroi
        def hero_x_modi (horizontal:, dash: 1.0)
            if horizontal == :left
                if (@hero.x) + 45 >= 0
                    @hero.x += @speed * dash
                end
            end
            if horizontal == :rigth
                if @hero.x <= (Window.width) - 165
                    @hero.x += @speed * dash
                end
            end
        end

        ##### CONTROLES DE MOVIMENTO
        def control_moviment(keyboard_inputs)
            if keyboard_inputs.size == 4
                keyboard_inputs.pop(2).each_slice(2) do |k1, k2|
                    case k1
                        when 'a'
                            move_hero_left()
                            case k2
                                when 'w'
                                    hero_y_modi(vertical: :top, dash: -0.3)
                                when 's'
                                    hero_y_modi(vertical: :bottom, dash: 0.3)
                            end
                        when 'd'
                            move_hero_rigth()
                            case k2
                                when 'w'
                                    hero_y_modi(vertical: :top, dash: -0.3)
                                when 's'
                                    hero_y_modi(vertical: :bottom, dash: 0.3)
                            end
                        when 'w'
                            move_hero_top()
                            case k2
                                when 'a'
                                    hero_x_modi(horizontal: :left, dash: -0.3)
                                when 'd'
                                    hero_x_modi(horizontal: :rigth, dash: 0.3)
                            end
                        when 's'
                            move_hero_bottom()
                            case k2
                                when 'a'
                                    hero_x_modi(horizontal: :left, dash: -0.3)
                                when 'd'
                                    hero_x_modi(horizontal: :rigth, dash: 0.3)
                            end
                    end
                end
            end
        end
        ##### FIM DO CONTROLE DE MOVIMENTO

        #### LOGICA DOS MOVIMENTOS
        def move_hero_top
            action(action: :moving)
            direction(direction: :top)
            @hero.play animation: :walk_top, loop: false
            hero_y_modi(vertical: :top, dash: -1)
        end
      
        def move_hero_bottom
            action(action: :moving)
            direction(direction: :bottom)
            @hero.play(animation: :walk_bottom, loop: false)
            hero_y_modi(vertical: :bottom, dash: 1)
        end
      
        def move_hero_left
            action(action: :moving)
            direction(direction: :left)
            @hero.play(animation: :walk_left, loop: false)
            hero_x_modi(horizontal: :left, dash: -1)
        end
      
        def move_hero_rigth
            action(action: :moving)
            direction(direction: :rigth)
            @hero.play(animation: :walk_rigth, loop: false)
            hero_x_modi(horizontal: :rigth, dash: 1)
        end
        ##### FIM DA LOGICA DOS MOVIMENTOS


        ##### CONTROLE DO HEROI PARADO
        def control_hero_stop event
            case event
                when 'a'
                    stop_hero_animation
                when 'd'
                    stop_hero_animation
                when 'w'
                    stop_hero_animation
                when 's'
                    stop_hero_animation
            end
            action action: :none
        end

        ##### LOGICA DO HEROI PARADO
        def stop_hero_animation
            case @direction_now
                when :top
                    @hero.play animation: :stop_top, loop: true
                when :bottom
                    @hero.play animation: :stop_bottom, loop: true
                when :left
                    @hero.play animation: :stop_left, loop: true
                when :rigth
                    @hero.play animation: :stop_rigth, loop: true
            end
        end
        ##### FIM DA LOGICA DO HEROI PARADO

        ##### DEFINE A DIRECAO DO HEROI
        def direction (direction:)
            @direction_now = direction
        end
    
        ##### DEFINE A ACAO ATUAL
        def action (action:)
            @action_now = action
        end
        
        ##### PERMITE O HEROI ATACAR
        def hero_attack
            case @direction_now
            when :left
                @hero.play animation: :attack_left, loop: false
                hero_attack_modulo()
            when :rigth
                @hero.play animation: :attack_rigth, loop: false
                hero_attack_modulo()
            when :top
                @hero.play animation: :attack_top, loop: false
                hero_attack_modulo()
            when :bottom
                @hero.play animation: :attack_bottom, loop: false
                hero_attack_modulo()
            end
        end

        #### LOGICA REPETIVEL NO ATACK
        private
        def hero_attack_modulo
            @time_attack = Time.now
            action(action: :attacking)
        end

        public
        ##### CONTADOR do TEMPO DE ATTACK
        def atack
            if @action_now == :attacking && (Time.now - @time_attack > 0.5)
                @time_attack = 0
                @action_now = :none
                stop_hero_animation
            end
        end
    end
end